Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E315FC35FF6
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 15:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hhXxdMCHtH2/18nQjMKTeIosnnBfs5NyOkAmHQgczio=; b=uodiZ6wXMBoDNv
	NjO48AAfj3JbSs51KSiXAKaYdhUhkLKgCSLffh6uZ3pB61WOBfX0GeNylHpybA96JGKdMrF23ntG2
	T8bwtafho95yhhXhG5wnEzXRyI+jDFWFc/FcwE/Ap6UnkVEq+mj+jp9uTRsFHIecBqdBcH5uFT5Gj
	J+6waS21EZ1vxoVaOaMII+syy+mJO4aW9h+30TsgTUQqG79fVOnZdE0E/USnB3f4mEhT/rp9Zc5LE
	+jXrnL512MPKzkSnhQfw/ogkmIgsD7V1geWq9lhEMRtm3jkzBC7e+afpSCiIzcBKM2f6sSDJ/4lOH
	MSfMWtNWGMHdYd/45sUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7Ko-0000000EdD1-2fmS;
	Fri, 14 Mar 2025 15:52:30 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7Jd-0000000EcxA-3gIL
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 15:51:19 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4394036c0efso15274755e9.2
        for <kvm-riscv@lists.infradead.org>; Fri, 14 Mar 2025 08:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741967476; x=1742572276; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+fRHRzXgCjmP/bnGMZgkYHknTcPw+tYfWwUZWqv1wRU=;
        b=ACUIP/bZ62vacEEyeh3w5TgcyZYqxDmVVbJLciZtHGhD6NEaMImaQz75bzxTwBY3rA
         uNTUzutJ5GI2u+lezGAT6eJygfToZz2S8EvWnRx6QMDyYUvZeCY6wGxlTuchizmvYjc9
         mH3S0vlRDsqrYmsAqNXheD6/UfApL5tRG9E9qMEDTbJTKXNoHi2bp+jvXF+ao6zRFTDt
         UnisIWV5b6idkZdWzaHymEt5LUPbZimyOS+P9whc5Fvfa6RE8wwb1xgszioLXcHh6zJ/
         86hzWIWfk3YvXk5538CIQVh1eMou9c15XPBpIDfAVYfSwkriN2sfa0vEPhIzdPcs7UIj
         +xzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741967476; x=1742572276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fRHRzXgCjmP/bnGMZgkYHknTcPw+tYfWwUZWqv1wRU=;
        b=hto/o15xcBwQlN9AT01Ejd1g99A1XmfbeI+ROIAfCHvS35ToGJkOwTEW7ZzyxuUo38
         1Fffv60RwPjCB28rZEQCvpqvXLwaK9lBI0DBU5E7Q9XfT0+uQVrFp7GC4TDJgIfCM4Yt
         MEqJKprZBLXby89PDXupFXye5P05pnt7J2bvDYF07XiR1Gq0L7zxesqHXrhGBQmkvIA6
         JrwtYoHaSsqVK6s3/beRb7RQz7QU68EDJbfwsnvBEFV1t0/6mtifYCcS7xMFO1D46HZT
         1tKJNJRtadx/OR2c7asp2Gy4t+dWvNyzV9UhnU91L/MxjeJq9+jfCWS/BvKLBSdf08Hj
         SEBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTR1O6iyOGFryGvrMl7hJ51FURtbItFJmxwjIqT+FpjiS7hV+tm7V1vOmeB7TuvaLkNSVGgjLZtoI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwzqNsc0L9UpS/3t7YTit3Tq0L9+IpGd9H0PkSDCVyC4v5GRsi+
	bsBs1nEOJKJRROuh4d8mVApXLfee8n6rpA3fWYgEsuBQrmr4sudeqdGoUOcxDIE=
X-Gm-Gg: ASbGnctv8/sbK0WW4eKE6vos4Dr6iN7um9I3m2x9cDLO4g3MTICwi6sjs9MVnM2zOuM
	xql5jPLoDKfvRDxl6NcLGZaxwO2fLrU/bkX6jwST70Ppwl2wl/uhvY9PIozn71zaRTeayJlgBrY
	fi1Zw/MSsWDO1HSSKQt6LnrP3Yfh9lCUP1ePtIiGByNJpc1Ro1gSgmZ5SW2AZsXN9GHjFQWn7L7
	AOckQhtFA/TqTUwszOpXhJ/vsh/z/vctC/ssvXlzVf21NY3Nd6x++AY4D54qni2o+HhZ48w0zzi
	d1doKkf8m1PdA/STP1SXDiWFcZYXPZjsUztT6Mmfo8O9C+fzYYTy9TrdtMnv1PM=
X-Google-Smtp-Source: AGHT+IF0xfqiSOAD/aXN3C4RaUAgjkDnEUSmI0lHDHuOw3S7x9Ps8i6yZGeRqXqx/ijFDdbau6zaiw==
X-Received: by 2002:a05:600c:350a:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-43d1ec8643amr43633015e9.16.1741967476398;
        Fri, 14 Mar 2025 08:51:16 -0700 (PDT)
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d21d67819sm15249945e9.21.2025.03.14.08.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:51:16 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: andrew.jones@linux.dev,
	alexandru.elisei@arm.com
Cc: eric.auger@redhat.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	vladimir.murzin@arm.com
Subject: [kvm-unit-tests PATCH v2 3/5] arm64: Implement the ./configure --processor option
Date: Fri, 14 Mar 2025 15:49:03 +0000
Message-ID: <20250314154904.3946484-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314154904.3946484-2-jean-philippe@linaro.org>
References: <20250314154904.3946484-2-jean-philippe@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_085117_932157_A1B35FAF 
X-CRM114-Status: GOOD (  11.84  )
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

From: Alexandru Elisei <alexandru.elisei@arm.com>

The help text for the ./configure --processor option says:

    --processor=PROCESSOR  processor to compile for (cortex-a57)

but, unlike arm, the build system does not pass a -mcpu argument to the
compiler. Fix it, and bring arm64 at parity with arm.

Note that this introduces a regression, which is also present on arm: if
the --processor argument is something that the compiler doesn't understand,
but qemu does (like 'max'), then compilation fails. This will be fixed in a
following patch; another fix is to specify a CPU model that gcc implements
by using --cflags=-mcpu=<cpu>.

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arm/Makefile.arm    | 1 -
 arm/Makefile.common | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arm/Makefile.arm b/arm/Makefile.arm
index 7fd39f3a..d6250b7f 100644
--- a/arm/Makefile.arm
+++ b/arm/Makefile.arm
@@ -12,7 +12,6 @@ $(error Cannot build arm32 tests as EFI apps)
 endif
 
 CFLAGS += $(machine)
-CFLAGS += -mcpu=$(PROCESSOR)
 CFLAGS += -mno-unaligned-access
 
 ifeq ($(TARGET),qemu)
diff --git a/arm/Makefile.common b/arm/Makefile.common
index f828dbe0..a5d97bcf 100644
--- a/arm/Makefile.common
+++ b/arm/Makefile.common
@@ -25,6 +25,7 @@ AUXFLAGS ?= 0x0
 # stack.o relies on frame pointers.
 KEEP_FRAME_POINTER := y
 
+CFLAGS += -mcpu=$(PROCESSOR)
 CFLAGS += -std=gnu99
 CFLAGS += -ffreestanding
 CFLAGS += -O2
-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
