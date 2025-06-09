Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6F2C5B552
	for <kvm-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 12:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jF4OJcvcFm7Ii55rfTsg3CC50lmas6EstV2VFwHBA5U=; b=yzXmZh1AdbnSWA
	EwMAhi69xuqtqo0oE0tQCDiy2bUrJHyZ0njNWRq878Z+GVRoyfQx9sh/V8et59MvCSgc5WjFiHxD9
	l24lnFaFwdBzrQay+iW1oHg6BY+OV3EGqpA9DaXmEvcoUygvxz9zxxWQCciPiNm1kQaZrMd8H01mR
	1qs3L/bR1o8DlsP+OX5rRre/z8fapV5tDWcLxGZbhIk7m7YzwMIBxfNHYp7sTKQGzdK6y8ZZ5mySV
	lKndAMiCusle5S+mEZcvaWxx91afzmyAU9DJBGlbuxV9z1+uzbD8svB0v3iJfvM44GGbDgW1IoQK8
	QgmU5wB23gHeR0YqpbjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOc1J-00000004B3R-2YOy;
	Mon, 09 Jun 2025 12:54:33 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOc1G-00000004B2U-2d4i
	for kvm-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 12:54:32 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a4fea34e07so2461836f8f.1
        for <kvm-riscv@lists.infradead.org>; Mon, 09 Jun 2025 05:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749473669; x=1750078469; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xB2zG2k1G4WQxpgsH4LuYksFLvv8C8C4QIYaKBnq/b4=;
        b=b/FwLbth8ep6r5HlHy7qv9xDslPQf8RcZR5LswlIHESokYyXt8Hia9GrIJJBD3Pm0K
         2/BHgpJiRKkN5Qys5ZkhIPXvqsDB1yQc8C+HvE7gBRRpo/Rnz0UmTSWG6G5Bjdspf5Oe
         0MY26Q7OhsHXZ48rwhoowJ5PKLXp3UBNkEt3yO4MB6HAF+dC9Szxy+KDly4+2XTzED4u
         OC4+0ELiCE2tWTTNntzKGVBrXuoGAYl0mq1lB4CDu2eUQjJgdqzN+pvVSXgCnRZwZLDn
         B6PmW+s0Y1C9WtsNQoS5tmxoLzB+96j0o7ZMU8CW8j/K3YrhZSOmDPi2oL+EzIX7Ll0C
         PEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749473669; x=1750078469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xB2zG2k1G4WQxpgsH4LuYksFLvv8C8C4QIYaKBnq/b4=;
        b=hiwbFPZKRZrM1XIYSbkklDrQzuh3gXX935OfMPSL7gniKtIMhFD/EDUBQ50v7At6AJ
         lluxrqxAjDdZAVsMlDP06M+viKDAXypeEZHoX8ek6qwHLUgGNpNyM0zjW8K7E3GM2plA
         Q0mBatu2LJvyPtIC2EeoWKzF1xkCNnoruJETRZCBIqzjEXwIkCbz8Rf8hd+WIvUPfoT0
         7LBY//cLloTvk4iRlDI4HmB/TeugCpOfF5rnpP2YgnYJ3OzXYGdwyN+a/26fwMY2mKrj
         iFQOWpn74FFIcQieHgJrfwUp6cGENHQJCRTstQvJV/VYSvIOFSnfbW/1rm36cQcOa9fL
         VbKg==
X-Forwarded-Encrypted: i=1; AJvYcCX9B6czfcWLIBEbYBTSpuEsJbtMhu9OllAWyAVpql2j2kqy53rRfodzR9ZdkenR1P/t8xszVDvCOHY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzcJ0V1kRJxE3x7mFXsB1VyXtukbb0Bpug05AnNjbbapGCbuGs7
	nRSutmXtOW3/Lr5OIuSTDQuk6pqV8JpRdv/qFV9HpNSgjswNOfBDMx6IitGceNuI9bw=
X-Gm-Gg: ASbGncuB2z+GOKCt6CDZ0vik7T15qSmqZn6/pfui5nJx/4q4ZrGDpf+OypbtGGKuTGf
	5LunUeQL5MBjGN2sHfXAR9uc/pMp+mbrIpk9WNTo2VwO2oa54bipIstD54GPJeMM9m7+g0XfKdG
	8/4/MDmI9b1abM+LSpazJM8Tw/jP4iZkz6IfSQKrMX6FzNmn1mpH/GI9oiliAGnFRzDgxvCqyDC
	zjaZ8OfWB3tyD41wXzkI5MmoRLT9fQzd6eb7h38fGSnzkjUaEOdIn2aQPfis9BVGfU+kWZ8lc/R
	S2meIx2syqk/+J5OAkD2NSDII8NsdPjC7rgIRSn9evNuuEvT6g==
X-Google-Smtp-Source: AGHT+IEC/1dBxgIFgGAmnWpdiKwEZouvKkkuBZf9Ps4mzSz9CyCY930v5yHNcYS1Azk34Z4raHel5g==
X-Received: by 2002:a5d:5f94:0:b0:3a4:eecf:b8cb with SMTP id ffacd0b85a97d-3a5318a7648mr10575693f8f.28.1749473668526;
        Mon, 09 Jun 2025 05:54:28 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::2f2d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4530748870bsm62109445e9.33.2025.06.09.05.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 05:54:28 -0700 (PDT)
Date: Mon, 9 Jun 2025 14:54:27 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, seanjc@google.com, 
	pbonzini@redhat.com, anup@brainfault.org, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, maz@kernel.org, oliver.upton@linux.dev, 
	dmatlack@google.com
Subject: Re: [PATCH v2 15/15] KVM: selftests: Add riscv auto generated test
 files for KVM Selftests Runner
Message-ID: <20250609-cb3c80fbe1fe702668830b1b@orel>
References: <20250606235619.1841595-1-vipinsh@google.com>
 <20250606235619.1841595-16-vipinsh@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250606235619.1841595-16-vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_055430_656218_0D96DE7C 
X-CRM114-Status: GOOD (  14.33  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jun 06, 2025 at 04:56:19PM -0700, Vipin Sharma wrote:
> Add auto generated test files for s390 platforms.
                                    ^ riscv

Thanks,
drew

> 
> Signed-off-by: Vipin Sharma <vipinsh@google.com>
> ---
>  tools/testing/selftests/kvm/tests/riscv/ebreak_test/default.test | 1 +
>  .../testing/selftests/kvm/tests/riscv/sbi_pmu_test/default.test  | 1 +
>  2 files changed, 2 insertions(+)
>  create mode 100644 tools/testing/selftests/kvm/tests/riscv/ebreak_test/default.test
>  create mode 100644 tools/testing/selftests/kvm/tests/riscv/sbi_pmu_test/default.test
> 
> diff --git a/tools/testing/selftests/kvm/tests/riscv/ebreak_test/default.test b/tools/testing/selftests/kvm/tests/riscv/ebreak_test/default.test
> new file mode 100644
> index 000000000000..d34b4b9b77ae
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/tests/riscv/ebreak_test/default.test
> @@ -0,0 +1 @@
> +riscv/ebreak_test
> diff --git a/tools/testing/selftests/kvm/tests/riscv/sbi_pmu_test/default.test b/tools/testing/selftests/kvm/tests/riscv/sbi_pmu_test/default.test
> new file mode 100644
> index 000000000000..5abb62c51097
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/tests/riscv/sbi_pmu_test/default.test
> @@ -0,0 +1 @@
> +riscv/sbi_pmu_test
> -- 
> 2.50.0.rc0.604.gd4ff7b7c86-goog
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
