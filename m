Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32935C3ABD9
	for <kvm-riscv@archiver.kernel.org>; Wed, 14 May 2025 07:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JBxN4h3N4L2Tnc4DUQck0CuRWOPgLsxQvpb1/lbrb3A=; b=U2I8IVu0maNOfY
	6ESj2OcAYCJG8AHI+jF0MGfDfW/Kyqax1eqNCMXeNtFmphhmtjIKZIvCXXF/KNA2zamQdA5ZYfV9a
	JDGkdZa+MZ6LddO2VT5/0YI9J5KvbEgiC36OBhXUFd9XyW+EJ8YFU2hfOqCNIxCNE6R56muoMCWKS
	SeD2SCee3v/oJ9m3U170RfW/4n86HRN4l9deqDgwaCguhw/roDbjVi1p+zT7L36fMOjnV2xDtdWra
	piKRAmoy/kRIZnsaJD9PEDrMt49oUPx7OzxA1BSyTCsk9lzVxIL15tvi3b1q8ceuRp1xoFoywHrDF
	uIX1qpP+u4OH7Z4UtIcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF6sM-0000000EOYL-3mpv;
	Wed, 14 May 2025 07:50:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF6rf-0000000EOUn-1gJz
	for kvm-riscv@lists.infradead.org;
	Wed, 14 May 2025 07:49:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747208958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GY5pVLDJBE/QxHoyRscYKOYBVWh0U1cYp7B4seYFbNI=;
	b=TSvDgPEblC++i+VlYfi9KqqD9zjTR+XyQj48v3Jxqk2Ehy8cKuig1gfpKJZHCFKQjPJl3f
	C3JWtl4AloFshAmWSDJGzJWrW/fbbjj5Ik9LE52ocQtZPb8atY0eXe8sbJ3PODVoRaP30P
	HpJJtyn7p8zHHjoFKyo/G5sXBtAyGjQ=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-9pj4bEcXMVm_v-cpAklzKA-1; Wed, 14 May 2025 03:49:15 -0400
X-MC-Unique: 9pj4bEcXMVm_v-cpAklzKA-1
X-Mimecast-MFC-AGG-ID: 9pj4bEcXMVm_v-cpAklzKA_1747208954
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74089884644so5848542b3a.3
        for <kvm-riscv@lists.infradead.org>; Wed, 14 May 2025 00:49:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747208954; x=1747813754;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GY5pVLDJBE/QxHoyRscYKOYBVWh0U1cYp7B4seYFbNI=;
        b=LziYjUVXUkly/IjE8jFFyFy0w+FKCZhkDvZRWUhqdMJoBhiOY8XpG0KNnt15bWuX21
         3uplBpYOqBQa3+nLWSTXk23t36xrGjhSzEJZgAGRKXxHa87iKHECXBdfLhvmoGlZgcrO
         jhvYLhHvKNnG364ctfBFlBjljVmBbK07SriT3AkDO8VBNAqi+Kqh/PqLanMVzU5q2GcI
         B3CGJ8GnbQ81wvKI6W5kmV4mH7A2MlC8Towk8kd2+uZmIR5mUVjorSJCkuiwllsNpyS6
         bMZmhs9Xrj20TMk6DDKz/Bj/wsoKZaBpBhV7V8I8COykd3d2l7lOyAue2FK/XIblN0A8
         IybQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7bCWVkvKZ91ECh2KKdYOtoVaGNphYh/eHH27pSWUe+pLKglRuE82B3+kL34JKa4LdS+U8BuqDxic=@lists.infradead.org
X-Gm-Message-State: AOJu0YxdnlMf0uOfDov/XyifneFQoOJcpgSorTIfLW3rWC6FcvDI3fcn
	5qCrA9PjFxVwLC/1OkxyVloQe8EkLJ0IT38jhbDUTXt77YYxk7FimdHD87Zn45cG3KMeqnsZ9gn
	XTcXZ5+UjBtr4+aWoJvn4HUuVUSs+y9eqBywYGMw6E8qBmknkrNCPdjjlkt22xKc=
X-Gm-Gg: ASbGncupLW12jiyRiOTgDAyUM7xKMJABDyQkDi87dNLBJcIaz5L58ElVSn6x4b3joVP
	24qfKIixFImNPfyhtIAeFKJ/jsomRwz69pAUaY5lSR2kZ1C3+OiGeB0YGQ2GZgx0em90hv98jd1
	BnDyn5dRBLVdErq/1XsFmD1z9fuml6j0K363CQ28x6T1Q1OW2VvhwYV6oPFDo61mbdb4xpaYS/x
	zUhGPcsa7knY53vOdSTgstrel2DdIUakmJtxY6PMMB6v510Oa3bpySzxj+4U5ZOYwY70uWHe9Ce
	vDsgbgYo0KSyeAwW
X-Received: by 2002:a05:6a00:a83:b0:740:596e:1489 with SMTP id d2e1a72fcca58-74289373d91mr3716635b3a.23.1747208953940;
        Wed, 14 May 2025 00:49:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxNAnjJT+LSzbpKrbMZgFeI/1Abe8EQQBbch700DZ2BLpon2TmE4Xe4l7GJrieZh9Qyjgk0Q==
X-Received: by 2002:a05:6a00:a83:b0:740:596e:1489 with SMTP id d2e1a72fcca58-74289373d91mr3716602b3a.23.1747208953574;
        Wed, 14 May 2025 00:49:13 -0700 (PDT)
Received: from [10.72.116.125] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a10881sm9212477b3a.106.2025.05.14.00.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 00:49:12 -0700 (PDT)
Message-ID: <67fb8130-94fd-46d0-8f59-1c047ff0a881@redhat.com>
Date: Wed, 14 May 2025 15:49:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v3 06/16] scripts: Refuse to run the tests
 if not configured for qemu
To: Alexandru Elisei <alexandru.elisei@arm.com>, andrew.jones@linux.dev,
 eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com,
 frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com,
 david@redhat.com, pbonzini@redhat.com
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, will@kernel.org, julien.thierry.kdev@gmail.com,
 maz@kernel.org, oliver.upton@linux.dev, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, joey.gouly@arm.com, andre.przywara@arm.com
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-7-alexandru.elisei@arm.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20250507151256.167769-7-alexandru.elisei@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3TG4Exz1ceQmiwas44rpsudFA9DVWlaGXemRm3khNhw_1747208954
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_004919_527151_B9523EF2 
X-CRM114-Status: GOOD (  31.47  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org



On 5/7/25 11:12 PM, Alexandru Elisei wrote:
> Arm and arm64 support running the tests under kvmtool. kvmtool has a
> different command line syntax for configuring and running a virtual
> machine, and the automated scripts know only how to use qemu.
> 
> One issue with that is even though the tests have been configured for
> kvmtool (with ./configure --target=kvmtool), the scripts will use qemu to
> run the tests, and without looking at the logs there is no indication that
> the tests haven't been run with kvmtool, as configured.
> 
> Another issue is that kvmtool uses a different address for the UART and
> when running the tests with qemu via the scripts, this warning is
> displayed:
> 
> WARNING: early print support may not work. Found uart at 0x9000000, but early base is 0x1000000.
> 
> which might trip up an unsuspected user.
> 
> There are four different ways to run a test using the test infrastructure:
> with run_tests.sh, by invoking arm/run or arm/efi/run with the correct
> parameters (only the arm directory is mentioned here because the tests can
> be configured for kvmtool only on arm and arm64), and by creating
> standalone tests.
> 
> run_tests.sh ends up execuing either arm/run or arm/efi/run, so add a check
> to these two scripts for the test target, and refuse to run the test if
> kvm-unit-tests has been configured for kvmtool.
> 
> mkstandalone.sh also executes arm/run or arm/efi run, but the usual use
> case for standalone tests is to compile them on one machine, and then to
> run them on a different machine. This two step process can be time
> consuming, so save the user time (and frustration!) and add a check
> directly to mkstandalone.sh.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Reviewed-by: Shaoqin Huang <shahuang@redhat.com>

> ---
>   arm/efi/run             |  3 +++
>   arm/run                 |  4 ++++
>   scripts/mkstandalone.sh |  3 +++
>   scripts/vmm.bash        | 14 ++++++++++++++
>   4 files changed, 24 insertions(+)
>   create mode 100644 scripts/vmm.bash
> 
> diff --git a/arm/efi/run b/arm/efi/run
> index 8f41fc02df31..53d71297cc52 100755
> --- a/arm/efi/run
> +++ b/arm/efi/run
> @@ -11,6 +11,9 @@ if [ ! -f config.mak ]; then
>   fi
>   source config.mak
>   source scripts/arch-run.bash
> +source scripts/vmm.bash
> +
> +check_vmm_supported
>   
>   if [ -f /usr/share/qemu-efi-aarch64/QEMU_EFI.fd ]; then
>   	DEFAULT_UEFI=/usr/share/qemu-efi-aarch64/QEMU_EFI.fd
> diff --git a/arm/run b/arm/run
> index ef58558231b7..56562ed1628f 100755
> --- a/arm/run
> +++ b/arm/run
> @@ -7,7 +7,11 @@ if [ -z "$KUT_STANDALONE" ]; then
>   	fi
>   	source config.mak
>   	source scripts/arch-run.bash
> +	source scripts/vmm.bash
>   fi
> +
> +check_vmm_supported
> +
>   qemu_cpu="$TARGET_CPU"
>   
>   if [ "$QEMU" ] && [ -z "$ACCEL" ] &&
> diff --git a/scripts/mkstandalone.sh b/scripts/mkstandalone.sh
> index c4ba81f18935..4f666cefe076 100755
> --- a/scripts/mkstandalone.sh
> +++ b/scripts/mkstandalone.sh
> @@ -6,6 +6,9 @@ if [ ! -f config.mak ]; then
>   fi
>   source config.mak
>   source scripts/common.bash
> +source scripts/vmm.bash
> +
> +check_vmm_supported
>   
>   temp_file ()
>   {
> diff --git a/scripts/vmm.bash b/scripts/vmm.bash
> new file mode 100644
> index 000000000000..39325858c6b3
> --- /dev/null
> +++ b/scripts/vmm.bash
> @@ -0,0 +1,14 @@
> +source config.mak
> +
> +function check_vmm_supported()
> +{
> +	case "$TARGET" in
> +	qemu)
> +		return 0
> +		;;
> +	*)
> +		echo "$0 does not support target '$TARGET'"
> +		exit 2
> +		;;
> +	esac
> +}

-- 
Shaoqin


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
