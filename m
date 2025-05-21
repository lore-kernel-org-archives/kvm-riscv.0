Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404A3C2D0CD
	for <kvm-riscv@archiver.kernel.org>; Wed, 21 May 2025 06:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G8lDKvoncEGmDrc7qmBeBlgp7s5EfruT3oneJEh1bPQ=; b=xgm9xbhlJI33WX
	TbCwhFWTYci2hjip7OJZ+FQwdTysWq7WXclLG0P3wbqqXTqGD36tAQX4dFijjkuq0H9Msz65y8fCJ
	/57EAxInU/c575x+xGarLo/JpNW1OMo7mpRoFT/ELBaoMGZkj/uR9EMn8qWpNS56ow1/DpgSOsmQ/
	Hr+UqSkP8k9EwNC1lxfyCL0ka6DFsw7jw018wAX/YAc2I6BYxyOOEYAaSo4w8TuFalHWwjPF5Ci5g
	p4zN2ViNu40IsshHDTAfd6eDdPzKnYEI9gcsAIi6qQrU+y090KWAEQI698Q680iUbZsVwuH1MRzPS
	Vn2wdkAOvKQ28z6k2yvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHckj-0000000EvEH-0593;
	Wed, 21 May 2025 06:16:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHckg-0000000EvDT-3EjS
	for kvm-riscv@lists.infradead.org;
	Wed, 21 May 2025 06:16:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747808189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iw5uJHJc2V+sRbe4e4Tg6n7ubVHazSs+sdmDhxZTg8c=;
	b=TeK0SRylKw6bqqRQR/W2tLODo9FlqzcXeLoplIikBeadKsSB+4+yQ4mRcztllaBxXi/UnZ
	IBvv/TOQH2rTKoRHf8UTeQKgt9Q9oTR+efKb+jGiCCtzuv1PgPii0ZD7sSv6X7mGm/y6Rz
	Bidqo+NBLAA8j4VQE4szs2m/PArwsJ4=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-3cuhnd2kMZe1qxr7wh5D8g-1; Wed, 21 May 2025 02:16:28 -0400
X-MC-Unique: 3cuhnd2kMZe1qxr7wh5D8g-1
X-Mimecast-MFC-AGG-ID: 3cuhnd2kMZe1qxr7wh5D8g_1747808187
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-6c8f99fef10so6749218a12.3
        for <kvm-riscv@lists.infradead.org>; Tue, 20 May 2025 23:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808187; x=1748412987;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iw5uJHJc2V+sRbe4e4Tg6n7ubVHazSs+sdmDhxZTg8c=;
        b=qClr4btlQyKm4HYJUOD0TuHM3Tkr2rYNbCev1h8Twhx4/eD/IrfGJM9LeceyryXEc+
         tqaBQzjem086EPPdCQLqVb+vvaxDrKU33WwbYXv6ucsEcuXHLMtx6wdCu4EYq5wCh5Qr
         1FnH8SEZ0qeYvggZNP4dcQzZ9wnk6hKkemx5PVO2imn9gofWOsT40i9CQR6oFqh8orj7
         Z3qbcoV6LDElW9NO7DUEmDE5minDSH0LLK4hZlC3PfYJXddqcNbCgj8Sqe4bzK0PMYJn
         bI82vYLcDmYFCCwk9GP/2cBQMWGTEgG/RZ7am8Z+zX+vxyeiVDwBpUT5RYJuEVKVNQv7
         p3Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWwTnVCcX32Z7PjnPvt9SzQl3onUX5GfeGNZA5+k/GnKz2DYZaW3L9htKL1oVBQ7qS2uiIBDefppTM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxVgK8o9pSxtuTCQ+KZ3bu1wr3ZptW8IflnGoHTSi2puvUKyulZ
	00k0ZlGRGp99JUIGnc0WSLxSsolvWdN1Vt1TWg/e+dn8xuYZtO9xP2dybHXPrgdpZeSyRp/BuC2
	iaCzn+pEWWdS/VRNxNo22pekM3Vn2xxyQ2ybRJKPGgisY7YNx1sbWKW76f79H9dSW1wc=
X-Gm-Gg: ASbGncvs32vHTKlYUoUOP8pOuE7rsQjzUQESmCjIEKJFC8k9h25+cK5svB4Iv+Jkk0z
	6uyqM7hyqw9Mc9/uOxca7BQa3zJAzzIkR7wGZThbkHi3LbANdg/+3mt95rXhdvmVs0xzU7IZxOe
	SWBuMzoLOfXZv85QsubvGR6FHc3YWtk/n7KS9Yoqt5WQBnQZIfXW2g2YH62hATsmV6As/iF+KRp
	udY8b5YNOmlIE/Qn1BkNxvTYxgFy8tKZQNRzf/JU/v+mOEvyXZ/BiOPXcdfuXzKuHJc74UGPbKM
	Nvmgud+mAqN0MhI=
X-Received: by 2002:a17:902:fc46:b0:231:bf74:e1df with SMTP id d9443c01a7336-231de3515demr258862285ad.7.1747808187199;
        Tue, 20 May 2025 23:16:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMaGJi9XZe04iIaqoT0LCToE4EYldNnY+Yj53uJr8Djqjif4zPPKYkEdeIkY17gXv01FY1iA==
X-Received: by 2002:a17:902:fc46:b0:231:bf74:e1df with SMTP id d9443c01a7336-231de3515demr258862005ad.7.1747808186859;
        Tue, 20 May 2025 23:16:26 -0700 (PDT)
Received: from [10.72.116.61] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed5460sm85707015ad.241.2025.05.20.23.16.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 23:16:26 -0700 (PDT)
Message-ID: <b5d2d946-7f46-4908-b44a-6ce80b67c46c@redhat.com>
Date: Wed, 21 May 2025 14:16:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v3 14/16] scripts/mkstandalone: Export
 $TARGET
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
 <20250507151256.167769-15-alexandru.elisei@arm.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20250507151256.167769-15-alexandru.elisei@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: M1jEKIxFJYBI24-zJYehZTCem2hYsPD0X2hkho-xD9c_1747808187
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_231630_887964_7D904315 
X-CRM114-Status: GOOD (  11.01  )
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
> $TARGET is needed for the test runner to decide if it should use qemu or
> kvmtool, so export it.
> 
> Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Reviewed-by: Shaoqin Huang <shahuang@redhat.com>

> ---
>   scripts/mkstandalone.sh | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/mkstandalone.sh b/scripts/mkstandalone.sh
> index 4f666cefe076..3b2caf198b00 100755
> --- a/scripts/mkstandalone.sh
> +++ b/scripts/mkstandalone.sh
> @@ -47,6 +47,7 @@ generate_test ()
>   	config_export ARCH_NAME
>   	config_export TARGET_CPU
>   	config_export DEFAULT_QEMU_CPU
> +	config_export TARGET
>   
>   	echo "echo BUILD_HEAD=$(cat build-head)"
>   

-- 
Shaoqin


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
