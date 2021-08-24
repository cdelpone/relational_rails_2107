CREATE TABLE "public.VA Clinics" (
	"va_clinic_id" serial NOT NULL,
	"name_vc" TEXT NOT NULL UNIQUE,
	"location_vc" TEXT NOT NULL,
	"satisfaction_rating_vc" numeric NOT NULL,
	"mental_health_vc" BOOLEAN NOT NULL,
	"created_at" TIMESTAMP NOT NULL,
	"updated_at" TIMESTAMP NOT NULL,
	CONSTRAINT "VA Clinics_pk" PRIMARY KEY ("va_clinic_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Veteran" (
	"veteran_id" serial NOT NULL,
	"vc_id" serial NOT NULL,
	"branch_vet" TEXT NOT NULL,
	"name_vet" TEXT NOT NULL,
	"SSN_vet" numeric(9) NOT NULL UNIQUE,
	"DD214_file_vet?" BOOLEAN NOT NULL,
	"created_at" TIMESTAMP NOT NULL,
	"updated_at" TIMESTAMP NOT NULL,
	CONSTRAINT "Veteran_pk" PRIMARY KEY ("veteran_id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "Veteran" ADD CONSTRAINT "Veteran_fk0" FOREIGN KEY ("vc_id") REFERENCES "VA Clinics"("va_clinic_id");



