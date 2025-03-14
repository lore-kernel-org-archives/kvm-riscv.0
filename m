Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C37FC282EC
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 15:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7LI0UwpCyKjYvszrLMR8Tp+E0oUofya5/DfXnwzw8LY=; b=0TdniaFiDU9Kmw
	blg12GliOIKWzBze4rjw6cSzO7RBO/2t8rOxiioknyQhxvAZ5mujTZ5lide1Qrjlr9GaarrAJ3sW3
	bj/cynPQ2cWdHK2L7H4uM+xlE5xm8XXpjjp0+3ToR3H52XtmKWqp27gZJCMEhcfVYXqjZ+b/12Lmn
	45NJsAlZlQ8fgdU+TMLfEsUp3s6xAAVIkrUGdtsHDsaZqIRU/CaZiYNVG1RAcHgXH3tBl7PJpwPQp
	CD2ZGYlIlkABE+NwkYuucH6d0rK1kCNrmQZa/wPfWayYG/18t+Txp0rzbJ0dBlgJqr5xe9b+bx9q+
	/OLN24V2GxhzNUArNf4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7Kn-0000000EdBt-2lpu;
	Fri, 14 Mar 2025 15:52:29 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7Jc-0000000Ecwg-2H8Y
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 15:51:17 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43d0a5cfd7dso15474235e9.1
        for <kvm-riscv@lists.infradead.org>; Fri, 14 Mar 2025 08:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741967474; x=1742572274; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BxWbhv91Bg9/1FyB7uOy2VxTZzLp0dnb4oXLuUhTuuc=;
        b=EjWPiZDHLD+4dQwGqiNGxUsqzmDryx/XJrAlP2todan83il57fvErEidOqvL9APwPc
         NUjSA3wO20+V1hOsI5P+ABHDbaWEdS+1a4+lT2CdPdU7a2PyVhGGVvtkw34xZlEUO5cX
         DnTAqMrLhBsiukPTu0pKCTgssMkz3hmmpCMdV68kFkb63WjuDm0/TgH/MVKsFkxZLzjj
         jzOUHGv1P3zxyPP13vnvxcX0woFnWIZDOIMw6qS754lAT2eWtpkSZQpLf1w18IjzZrKW
         PdD5JZqwzkbvwTnYY4cR3P46W01tFjOQhQWrH/eikCJoVkE4Paksn+RLBjQFd/lftGJB
         BHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741967474; x=1742572274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BxWbhv91Bg9/1FyB7uOy2VxTZzLp0dnb4oXLuUhTuuc=;
        b=d9yV2yQJA9XWriqjdOmrG+YmMzKSmghEqGoYKlEP1Hri7NOfQEoTfM5kYBjOTVR+x4
         Ltes8OMMbOda3u+NTXGMA630iaoShPrDSEo7g+eIY4nD4ACB1uEltY/LosR+Ily8XHch
         Gwuo1VE1aC9UncoIdYQhyJWrD8a9A7lSJ1SD8Jm0OmqdZRXWz5wTFAqU6n7oS4+3tUUW
         MnFhUdL4Eh3CPIw581HkJbgnERiPTNsN60Woqj8cJ4s3UFnOS6/q1SxPApWwBs8PUtxq
         DOkqgYlzt04iCjFDkoq4IUoLloXHd+8Wu27SQTSujIDwzkeH4nUQ9pVEpMyTZUt/RYxs
         Oa6w==
X-Forwarded-Encrypted: i=1; AJvYcCWQbhSIy/c/uBysEP1goxo2SJvGDZrnDr1wyvrzOTxJIie8n1MzShRMPefyVJ14NLWd/ZzwO8g3kRg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyFq9arirfHRe+qe2/CDk0iVeIvrHLFr0GZeQk9ZKRvrloEc4Si
	y3JB2oRI8WRq+YeezT7ifz3LN2dzbQkWK0gB3EePQjg7Y4HjKkjvE+GeUCgas/o=
X-Gm-Gg: ASbGncv2L7ycecwf7vabNPJoPYNO7LB3PxsxM2VYxb3dBveLLgufqk25Cun41EL72PI
	k4gzOvAgqVrBrs0U+3TgQEAXCWCqENv3NETaPebvlBI4cMB8oW8VG2DqXzV724MCEXl4DzLNBha
	pEIjnReYQzB1XAhus4X2d348t/3lFnPZfKaZ8VBN7vQuqMtlUXNzHxNgpYFBoyVUdSs6ibV5b/g
	K7yli5yCc4mJvCdXO6Yj2OI4nXH+iZTLEeyqFxKyZ9JXmJryOXDngOyuN8LYVtVJg9HM2LXGUX1
	yWNsiaZ80r5m4WgbEZtyeUFYheAKdzzpUurO/Wwxnn6MyhaVwpaxClFv5KHAW/Q=
X-Google-Smtp-Source: AGHT+IEokO+3Wk6AyeH4Dqm42uc1ybfhtzvrL/+C+eKBmDBhVkHi2YIMqZsjG3HR2Rb8VWwFY2Q8XQ==
X-Received: by 2002:a05:600c:46c4:b0:43d:24d:bbe2 with SMTP id 5b1f17b1804b1-43d1ecd10fbmr38111635e9.28.1741967474548;
        Fri, 14 Mar 2025 08:51:14 -0700 (PDT)
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d21d67819sm15249945e9.21.2025.03.14.08.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:51:14 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: andrew.jones@linux.dev,
	alexandru.elisei@arm.com
Cc: eric.auger@redhat.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	vladimir.murzin@arm.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [kvm-unit-tests PATCH v2 0/5] arm64: Change the default QEMU CPU type to "max"
Date: Fri, 14 Mar 2025 15:49:00 +0000
Message-ID: <20250314154904.3946484-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_085116_580984_CAD34FC8 
X-CRM114-Status: UNSURE (   7.36  )
X-CRM114-Notice: Please train this message.
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

This is v2 of the series that cleans up the configure flags and sets the
default CPU type to "max" on arm64. Since v1 [1] (sent by Alexandru) we
addressed the review comments and distinguished "--processor" from the new
"--qemu-cpu", to configure build and run flags respectively.

The default TCG CPU on arm64 was the ancient Cortex-A57. With this
change, we can test the latest features of arm64 QEMU, and for example
run Vladimir's MTE test [2].

[1] https://lore.kernel.org/all/20250110135848.35465-1-alexandru.elisei@arm.com/
[2] https://lore.kernel.org/all/20250227152240.118721-1-vladimir.murzin@arm.com/

Alexandru Elisei (3):
  configure: arm64: Don't display 'aarch64' as the default architecture
  configure: arm/arm64: Display the correct default processor
  arm64: Implement the ./configure --processor option

Jean-Philippe Brucker (2):
  configure: Add --qemu-cpu option
  arm64: Use -cpu max as the default for TCG

 scripts/mkstandalone.sh |  2 +-
 arm/run                 | 17 +++++++++++------
 riscv/run               |  8 ++++----
 configure               | 42 +++++++++++++++++++++++++++++++----------
 arm/Makefile.arm        |  1 -
 arm/Makefile.common     |  1 +
 6 files changed, 49 insertions(+), 22 deletions(-)


base-commit: 0cc3a351b925928827baa4b69cf0e46ff5837083
-- 
2.48.1

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
