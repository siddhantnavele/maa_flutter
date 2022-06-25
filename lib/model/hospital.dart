
import 'dart:convert';

List<Hospital> hospitalFromJson(String str) => List<Hospital>.from(json.decode(str).map((x) => Hospital.fromJson(x)));

String hospitalToJson(List<Hospital> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Hospital {
    Hospital({
        required this.hospitalName,
        required this.locationCoordinates,
        required this.addressOriginalFirstLine,
        required this.state,
        required this.district,
        required this.pincode,
        required this.mobileNumber,
        required this.website,
    });

    String hospitalName;
    String locationCoordinates;
    String addressOriginalFirstLine;
    String state;
    String district;
    String pincode;
    String mobileNumber;
    String website;

    factory Hospital.fromJson(Map<String, dynamic> json) => Hospital(
        hospitalName: json["Hospital_Name"],
        locationCoordinates: json["Location_Coordinates"],
        addressOriginalFirstLine: json["Address_Original_First_Line"],
        state: json["State"],
        district: json["District"],
        pincode: json["Pincode"],
        mobileNumber: json["Mobile_Number"],
        website: json["Website"],
    );

    Map<String, dynamic> toJson() => {
        "Hospital_Name": hospitalName,
        "Location_Coordinates": locationCoordinates,
        "Address_Original_First_Line": addressOriginalFirstLine,
        "State": state,
        "District": district,
        "Pincode": pincode,
        "Mobile_Number": mobileNumber,
        "Website": website,
    };
}
