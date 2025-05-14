Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC12C3ABCB
	for <kvm-riscv@archiver.kernel.org>; Wed, 14 May 2025 03:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=haFmOuOflqrnuGtyyWzwn5nC48EiDCgi9LKpi18Oapc=; b=Xr/ZlVNPS8E59F
	qqf/L73ouqX1r0vpPV0+a2nAvJv9XvSe4/MRSrYF8Y112EEY8czUokm1yE89+EsyyQGn5/Hcb/Jav
	A3elljbmEkHe9U7ZS2TcEiWrJpotsNOmhR7GlF5nST4AAbO749JAmmDvHsWseWIrfJaLdpu5TNCII
	dlqZwTyeP+w6MuAuh3htEH8F2kqwqFiADveEe82Y9jTKEZHto4KjHPSiVn3+UfpwXbcReAemcA3uk
	3CYGedY5uITbME0NenjYoSdk3Nrl4WqPNd7swuxBRHIGN2/lTmY7i03HWlc9xAzehOwH7xVqEvqg+
	Et1/57dA8TUaKOBXDgUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF2oo-0000000Dx16-2rN7;
	Wed, 14 May 2025 03:30:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF2om-0000000Dx0k-3DCV
	for kvm-riscv@lists.infradead.org;
	Wed, 14 May 2025 03:30:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747193403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zPNj1R9ALDGy4ZhAvSAe9nUoPzbthadZcf4T/oJDS44=;
	b=BLqh14AK3i7yq/SIhFdIqLoMtEscnaCcni++vjELUvuo9ccaUuNG2PsuvRAzWtKck4lnwI
	R2978GwDIgjes9m5so8sPcCpaEpVDmYdNs7Q867VAmHwlgvCVjTK1SR+cDKBQzJmIhvOTu
	iTk9sAxY4VXFDq+i+orSXwd7SHR2Y5Q=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-kCzaIosVOzaK7jBWj63Z7g-1; Tue, 13 May 2025 23:30:02 -0400
X-MC-Unique: kCzaIosVOzaK7jBWj63Z7g-1
X-Mimecast-MFC-AGG-ID: kCzaIosVOzaK7jBWj63Z7g_1747193401
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7391d68617cso425131b3a.0
        for <kvm-riscv@lists.infradead.org>; Tue, 13 May 2025 20:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747193401; x=1747798201;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zPNj1R9ALDGy4ZhAvSAe9nUoPzbthadZcf4T/oJDS44=;
        b=PmikUAxfU0WPxGv6n0cL/JcVlqocfmps3/poh66hvWtV4U4Krp17C+sGQ/ZMYXhquc
         j9uSlaokipQGHzTGtOktHXMY3uHP/dls88k+pciZfZ2RPQEvIYMA5v/53nb0+qYkvW7N
         /ZGTMaocT654034BywMJ6C6Qu9xu8sshCZztD3RKmI69sVK8QRQsdlritk97XijI4Nd7
         Nm2aiu/kiTSvmoDb1xPrcMMghutE18HlOqigr0s2ggZaeQUObvyVcpN7nEeQ0tgbtEC8
         5iwM+MeVjQWyPQ54SZaVVwjrlV1nBzscE45BIE6e+Ei0orICq8mniJh6jKFj4F+RbYd2
         PCmg==
X-Forwarded-Encrypted: i=1; AJvYcCWVofkfeuCQ2mRCnjdF15KIVUsTDPZODGDWdskYSkmMre/bRxznEGWXVW0Y0pRIusDzzbhJ2pCi9oI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwIcmnhNMTRyHfnyESo/iix/0mwtNjQ3ogWtttUuHr2n5fG6Nkj
	P+ailKeetl5YEeJKhnhGthBX+kx8Y3WwUCj4M59ojRC2FjfiuQu3r/LvI/AIN8oNK+RdJVjR1dS
	EavMnp357PTwJM91Tn7kuEKLEKpgY7MU05PZL3Vz3WlBewQG5P8gPjNwPs9WMkaA=
X-Gm-Gg: ASbGncsinoZyfhChgWlCJUlDCgLelKHKYWRV7zM7xjxjiGgtB4ABFBym/jEunuiFvEl
	txeQChYItUaM+j3w/DLD8dwkPPO0zWyLdIW1vevxCGByEKfDEyX2muXWtxBjJXMfO5X3D6j9dRL
	I62q38crMMmVHyxbO6V/4jffQFRZ9SMEkraAf3Ey/zr4CgDDdfg+RbmbPnSXdgYQCqAKqpHtnrK
	+iS4Blw5VjLwgkBAyW+LaN6KE2B1woWLsWva6lKvN3AaHnLufTmpCpIQRB2sewxRguPGK8D2Eet
	dOrGqD4JAdC93nKB
X-Received: by 2002:a05:6a00:849:b0:73e:2367:c914 with SMTP id d2e1a72fcca58-7428907dbbemr2608215b3a.7.1747193401137;
        Tue, 13 May 2025 20:30:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4NfRMilmo0WhS6bonXckoq6ayKF8QYGypn6TRZn6O1csy9tmwHCGt4njEOo+8VL50NM6NRQ==
X-Received: by 2002:a05:6a00:849:b0:73e:2367:c914 with SMTP id d2e1a72fcca58-7428907dbbemr2608173b3a.7.1747193400666;
        Tue, 13 May 2025 20:30:00 -0700 (PDT)
Received: from [10.72.116.125] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a8a3adsm8406109b3a.158.2025.05.13.20.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 20:30:00 -0700 (PDT)
Message-ID: <54b5bb37-5304-4e73-afc8-bf2a23e6490b@redhat.com>
Date: Wed, 14 May 2025 11:29:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v3 04/16] run_tests.sh: Document
 --probe-maxsmp argument
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
 <20250507151256.167769-5-alexandru.elisei@arm.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20250507151256.167769-5-alexandru.elisei@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CibgFVZOjf4PbVoWKuJjLx_sqanXLKO_UoLIilU4eFI_1747193401
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_203004_892607_4F1050F2 
X-CRM114-Status: GOOD (  12.49  )
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
> Commit 5dd20ec76ea63 ("runtime: Update MAX_SMP probe") added the
> --probe-maxmp argument, but the help message for run_tests.sh wasn't
> updated. Document --probe-maxsmp.
> 
> Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Reviewed-by: Shaoqin Huang <shahuang@redhat.com>

> ---
>   run_tests.sh | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/run_tests.sh b/run_tests.sh
> index 152323ffc8a2..f30b6dbd131c 100755
> --- a/run_tests.sh
> +++ b/run_tests.sh
> @@ -17,14 +17,15 @@ cat <<EOF
>   
>   Usage: $0 [-h] [-v] [-a] [-g group] [-j NUM-TASKS] [-t] [-l]
>   
> -    -h, --help      Output this help text
> -    -v, --verbose   Enables verbose mode
> -    -a, --all       Run all tests, including those flagged as 'nodefault'
> -                    and those guarded by errata.
> -    -g, --group     Only execute tests in the given group
> -    -j, --parallel  Execute tests in parallel
> -    -t, --tap13     Output test results in TAP format
> -    -l, --list      Only output all tests list
> +    -h, --help          Output this help text
> +    -v, --verbose       Enables verbose mode
> +    -a, --all           Run all tests, including those flagged as 'nodefault'
> +                        and those guarded by errata.
> +    -g, --group         Only execute tests in the given group
> +    -j, --parallel      Execute tests in parallel
> +    -t, --tap13         Output test results in TAP format
> +    -l, --list          Only output all tests list
> +        --probe-maxsmp  Update the maximum number of VCPUs supported by host
>   
>   Set the environment variable QEMU=/path/to/qemu-system-ARCH to
>   specify the appropriate qemu binary for ARCH-run.

-- 
Shaoqin


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
