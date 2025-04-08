Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603B2C369A7
	for <kvm-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 13:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X6Rub6PWoVyA7M7Z55Vl9Dn9wh9Wf5u4Hj1CIXnSLGc=; b=bB1STP05B8rx7G
	qdfl0qD0+N4Mfl8L+yUcTjV9hprw51ziny55kZNsU7drX5g68/wqS1cYNyJsieiFGYkCAJwNdv3Xz
	eKJOG2DRkwZjXgB2+kEaFAFp3RrTV6wISx76e0dCRKscRctvIpPOmgUzNd7k7xlAGtHEK8IiWX1/T
	WvUicmRGx0de/bO1y69Y47z7TyzoJZwAi64hnlDJs3QCKIm7Ra/eITk3uH4cI7f9qXwguvZD+L/l/
	+nCUUoMgtiPeixfIa6z6ExAjLD32ez1n1T8chJzUKc4t8xN/AjXmMuj7me5yFKK0kwA8npQJbnMNV
	hjtj4EAAXKkzu0LwUg6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29QG-00000004HHY-0SMC;
	Tue, 08 Apr 2025 13:55:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28t3-00000004B7d-34uo
	for kvm-riscv@bombadil.infradead.org;
	Tue, 08 Apr 2025 13:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=vR6Kj/v7QUx4Q9A4sOPDY+B+4TbUf4f4gjMITODv1GI=; b=GOmqeUkfUFaUFRQ2zyQjV8hfFK
	zmpd8PgzIHEq+wJoAvyuxOI5c02j1j3FkGxjqZPXsEFtc7mdMzgo0CcIwB4Ny75kMHVQ2CqrH0nU2
	ipTTpRv1fA80TfTsfu7ZWqQt2nq8BSKOvloX88NuVWbLGHek3sT1J3rtcw1wcUdfC2SLZg6u8PMM7
	7mnzv6gTVQzbKWLrkYMfpO/hIcJ91A8ejthPSqd4L2jP2RrP1At24eiKTuJ7BZq0ohNac38Un6uX/
	eCZ8xy/x3URrEND1Z46Ix1UDha/3w5eY6H8c/yzgNcEHp+WCJ4C0hHM3gmzh4lkGyIkHhMDjBhLIT
	hcdo9Ojg==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28t0-00000008JD8-11HX
	for kvm-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 13:21:08 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso4112864f8f.2
        for <kvm-riscv@lists.infradead.org>; Tue, 08 Apr 2025 06:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744118464; x=1744723264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vR6Kj/v7QUx4Q9A4sOPDY+B+4TbUf4f4gjMITODv1GI=;
        b=epM+m0sKyYdiYlSOr3JFnDQa4RoFMBoIhtlsnrUHw1rKnEEoxvVJIPOmRgQdec5jKj
         k+Q3uf1RhkqPci//b/hj4mPpjSHYKBOsRiFXRncmMy11D1kx7b20Ri/7LrjYnEdgNjyM
         UUIFBcFdWAcULkhYYR2z6OxQx1E7nQ/U1FR8UOaRfo0uCwJAAP21scNfxwV1oncl2fs5
         ssFAJ3ffcoLB/RAFKUnfcAd7iqfAHaGFJDLdkELoj0lt2PfyHP48wFNz5u6tS0MWNdXG
         0eVnBhcIKc1ewtxru5Gmf/igWYlWpyPU7e+MaaQ48NoZ8CGyUrfQQs89/EqRQPvHIm/p
         o+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744118464; x=1744723264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vR6Kj/v7QUx4Q9A4sOPDY+B+4TbUf4f4gjMITODv1GI=;
        b=mp/iYQVOo6wJoAsTuJG8Zd02aXXNhoAmuwx8Cz0b15rGkTjJ25CgmgvOuwxq0zRhYX
         Yp4buqWMUqQ+/ZnFzd6TR6ROnE2DZGgoAy8qrwRX9eNSpvkCGrKiiEg+KBD+UvcxsOLD
         ec8liayupIauCn73luO7Y4X1J5iX+NP6rNgbgAx+MyQHncn8MaKfWLXP4MsbExQ0QUSw
         ILSMKaorcpl2ozqv26idv55EDeqIB1aszVF/bMQa0YQ58QS2Nu8OVWdikAojq3BYaLZw
         BgQLC9hQVruMeBM6n291KEO6SwXwrWoSXqM4eWUJsnz90bQLVZwwwKnP/pYdfWHPJvn6
         q/8g==
X-Forwarded-Encrypted: i=1; AJvYcCUMhjemyTooc4NxAowyZAuocaQ0Wny78/PqwuKcqKch4C5+OI3PE9lqOjR8Uc1jdjXSZwGMf0QzTVk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwZC7Vts+kJoC4L0XFbf21wSbzXAwye/kSHS1eRrwnO7rQjhNyn
	OwN7gJjOqKkUOan0o+J5qsUqn19n5h4MwqLILqA8WObCXfJ/iOFMf84isdz1bgE=
X-Gm-Gg: ASbGncvu0Nfn8PfuNesjAtJyexQDbqTLnkLQj7T30AL6O8Xoevxr/p7KmdrCVcllDf+
	vUHesRkAAw4k4NIt/OIYOZWgyKQ1OXvFXErfutixFeMS5Dy8wNDhbenJN60DCi3rosCFMisKELf
	KrORxx9eiilgeNRyk+MszuOB0EkvPHwHLiogQ/IiJytTiz+VSsFYY4PjRS6F0jajI/AAk0/eS8K
	Sa4P9D/EVId6uEGPM3thiGYZDzKm8m8lAGDOXs8nvzOReL4nL8JbtGNguWeFIHiUuQsvuY4Rr4E
	9LyWLuc3fQ0042CShTislMv5RptByjSpcbh0lokF6kQLe0S9VxOn3rxCQp+ObDI=
X-Google-Smtp-Source: AGHT+IGEYZcVHqPxh9b9iWTJrtArQr/utyYTQwlK58Bu3joqs748+JSADbxOpv7hF62mBqzNbjJDBA==
X-Received: by 2002:a05:6000:4212:b0:39a:c9d9:84d2 with SMTP id ffacd0b85a97d-39d6fce0eddmr10745293f8f.46.1744118464024;
        Tue, 08 Apr 2025 06:21:04 -0700 (PDT)
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec36699e0sm162159705e9.35.2025.04.08.06.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 06:21:03 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: andrew.jones@linux.dev,
	alexandru.elisei@arm.com
Cc: eric.auger@redhat.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	vladimir.murzin@arm.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [kvm-unit-tests PATCH v4 3/5] arm64: Implement the ./configure --processor option
Date: Tue,  8 Apr 2025 14:20:52 +0100
Message-ID: <20250408132053.2397018-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408132053.2397018-2-jean-philippe@linaro.org>
References: <20250408132053.2397018-2-jean-philippe@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_142106_398779_C30DCC18 
X-CRM114-Status: GOOD (  12.71  )
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
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
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
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
