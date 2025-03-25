Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFFDC3600C
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 16:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X6Rub6PWoVyA7M7Z55Vl9Dn9wh9Wf5u4Hj1CIXnSLGc=; b=YlJcmM7GZAS0HB
	DX/rNSfaqUYbSVWPW7LLD7elgTzHl9qB8LjM9KAHPKo00I/eFSWsioEPw6T2I558YcqjVIDDnA0hv
	70fP8npkDxjgFFrym+/Ay9qr1MsjBddcK2TtHFMnr44q5ARpRt1/AieJItsv7mK5K68+XVtk4KtYX
	8V4tL4v2r93OCU3ZRsVkFc3RROA8PdfQp2312a/3J2BMDpaVuEKu7taEzawpzoi9Cu3Cm0cFOPhmR
	edIMFPWUHe2CWQq9wbqNw9mIseB+1mXFmludYFmySL+wAXuk4ab3h16BsbP+zlXLaRw+9fmwNhHIv
	B3qU/jGLmVUWrEipmQNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6yu-00000006SVj-2l3v;
	Tue, 25 Mar 2025 16:18:24 +0000
Received: from mail-wm1-f51.google.com ([209.85.128.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6oj-00000006Quh-1lJW
	for kvm-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 16:07:54 +0000
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso41065235e9.1
        for <kvm-riscv@lists.infradead.org>; Tue, 25 Mar 2025 09:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742918871; x=1743523671; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vR6Kj/v7QUx4Q9A4sOPDY+B+4TbUf4f4gjMITODv1GI=;
        b=AXnADttSmPDHNVeauFEhxEkVYH+ReiUbPmhu4ZRZNRERkCyf4hCt3ODQh4pDaFz6Pd
         LiuMG/0VPz0+enK03gZtTMQVChvRyQN9QE0rINJy96fcYLcObzvf3q3m7nXCMj5tTymP
         kq7zLZYCIPwlIC2jEw0r0uVZyKala5OeE6GIQfuQPahLuawqXZFZ12kFylVHC8VKweeN
         Hz1wzT3jD7OedS+GIqDCfP+C90I8/u1Mejy/+uwmp7khtU5cR9mjZr/H6zBYozeepu4Y
         5vuTpJcXK9kYL3zCf4DANvfE9ylJMJ3g0uVAA1/pUBI8DJsBTKnefPjLaFD37Dc0i8I0
         l+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742918871; x=1743523671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vR6Kj/v7QUx4Q9A4sOPDY+B+4TbUf4f4gjMITODv1GI=;
        b=eqnbxJMo7oRZ8P32AMC1wdNrtfS6mbtXJFd0xZ9C10PYHqO859LkRCSqB/dT+7f4ZL
         DDKdZK4xjUrWDq+KFkj4Z6xdS5CdzXtUphO2JUCHYaaC4lSQfxMRG0d9+kamEsX9HlsK
         E4pJyUOrxzoZwiEt2dKUZzpPo0t3Ec5PafrFpiLdzP70RZzHL4XnujY+prSyBL2Zyb05
         fHiRsSAjJUBOcGU5F86OyG+ir4roxkxEjocUDprJooNA0mmVDkDfe3fPSMKnl35gmeJ1
         852nrboTWfipPws2b9AqUM7JDS4nerjqWre8nNbbcJK9etwY3XI0pm/uoDlNDJvflsQQ
         47UA==
X-Forwarded-Encrypted: i=1; AJvYcCXWi2Xa3366V/GkyzsN9awR5PCvi3d5zdqBtgcTjGmmOeao+cHHLPXjowYqRtmejPpK6XmLMhRi72I=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxxh+AU3vnR7InBCAesgBhkYfKN5F+NnlQfAQsGbUBMQldu6LIz
	M5R8C+VKHfxYkb9UAh8EfON+36i1cZNR5Ch9DXvVRxp5/pgc/N5Z3vXYHdZbf8w=
X-Gm-Gg: ASbGnctbuZIJumTZxI3kJvhZ82d7AvOHQCSU+d4jGM7gqwCDd1X+8jd9nbXvGiBHqss
	lHVpUe3AIrOcG1RTiry1wPiIv60tNWyFr85yfaSBynLIUJZ624XxbNjI3VGhaHqxUMIrQ1GtsAY
	5oMFLPXmxL+qe1oJaSNqXzybINrd2wN7fGlG+Z2AjXdXK9kFH/4+mlGU4ebGFyztzS3OvPEKSAs
	+S4TkurlUbnUlTE5rGJxbyy5hQQjSDrt5Y7fadUBUl/KvV/3vFYXs9FnBuYJXFXDCVfNoiKdqFN
	ZoZ28kS8V4TbDl0IH5/r5nYNK0TyBLztf0EaWp04sPJAUN9pNvmVO+QsKPvnOoc=
X-Google-Smtp-Source: AGHT+IFcVqxqtEj63q0t7fchOfzrlKAVFuDwmZJ4n8qfIqVbAeEYL3vXur/5eNhzGwJap/Peq1YHNA==
X-Received: by 2002:a05:600c:1e07:b0:43c:f61e:6ea8 with SMTP id 5b1f17b1804b1-43d509e3b14mr173288785e9.2.1742918871445;
        Tue, 25 Mar 2025 09:07:51 -0700 (PDT)
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f43cbasm203972195e9.9.2025.03.25.09.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 09:07:51 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: andrew.jones@linux.dev,
	alexandru.elisei@arm.com
Cc: eric.auger@redhat.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	vladimir.murzin@arm.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [kvm-unit-tests PATCH v3 3/5] arm64: Implement the ./configure --processor option
Date: Tue, 25 Mar 2025 16:00:31 +0000
Message-ID: <20250325160031.2390504-6-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325160031.2390504-3-jean-philippe@linaro.org>
References: <20250325160031.2390504-3-jean-philippe@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_090753_458372_19A09FBA 
X-CRM114-Status: GOOD (  12.48  )
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
