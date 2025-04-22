Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817FCC369C2
	for <kvm-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 09:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3vyp/7k/ZOo74Ubl9auqQAM6ycPEIN0CbQnHzjztxhI=; b=dC60g6OcNW5AwL
	d47bTKUYRok5fFBPlPWQhQ89Rhf6d6btykBVzu5zyiE1GxveMCHp+fH7vykTbZh+QPSlZ8Gh4CHqR
	i7vowWteP7hwEcPBQ+wwzNtsHhEja4rYPQmJ3llfOx9YrUhYyOK0x1WsyUmmBd0QrJs8DyUrEyfss
	mUXB9zJ3Zg9Yi4p0C3/3PUpt9KG2A7eiaIDVAsn0sdwZSF1z3tbl/ujoFFD8OSROv2mgeb9m3jinC
	WWEqH2SLPK1THIKEvR2TZ9LDdeQ51f8GqeWygM3FWWjz9rDZp1qyLjvMWKtHnYTV9l9XbqijLNm75
	aMqdLUYza93dLzJztURA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79VQ-00000006TBi-3pJI;
	Tue, 22 Apr 2025 09:01:28 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78xD-00000006Ik4-1PQa
	for kvm-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 08:26:09 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43690d4605dso38940455e9.0
        for <kvm-riscv@lists.infradead.org>; Tue, 22 Apr 2025 01:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745310366; x=1745915166; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V/cAgNjQa95gQP7B/B/snS+8c4HbJCPXR5Eh8cVo7zg=;
        b=VxrcMNrVEofzpNHvQpFetASnnP6Ghj6lWoLfJQjfc/li5ZJo6BO8m2CcZ6xzd/Twpv
         w7R4s7MBpXhB/nLZqWYZmpO+mw2Rpcvtp+i+CcyyeAJZpGrM+LSQhtXfG18lRG34zmv5
         niSUVCFtDgzobClOJ32/PXaHFqnY1+IXqzbZlXCjmx4ElXqXR2vn9EOeTRnE+rS8s+Wu
         0b2OG8CRYCDn5T9ES/dj2uNVFjnxwV/Jn0f86moHKtVQj2M7vKUqVZS4qU3/JEdIM5f3
         DtZOLrkEW18s3sdg6yyDLM3eVa5yAe7+bZbSxsnfbMeVqN6sL4cPZt9lRAk7uQZPB0TK
         /KGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745310366; x=1745915166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V/cAgNjQa95gQP7B/B/snS+8c4HbJCPXR5Eh8cVo7zg=;
        b=WQyoCbz4rp1xi8AMkjQnDStRVmXeljwa4oIeuQw/Ska/n7kViOyG9TtbczN1Dh9L+h
         KrzVdtn45BsSqvPZUPX/tm4XXgFzrotxK5Ot+cPLDGGlictJxhxI2YxNxM12jpE+tovR
         j/zTZAy4FfvH1M5dT4GntDeb4Cwh990NWLwO6DLPDpdND3RVk1e3lgOJoBOOPpBrBz9S
         kRTwGfBvuJnQeCd5rGxSGSNu2cBNDfI0BjZSmRH1QAFFYsHEinRxizgArEIFFORdvjF6
         42TT2Mcxd6u3t+d8Wh0ljjwgHM6PTPvDxJN1ZSaOjluXBRpYtTfGlTFZjHBxXzfJR+Qp
         n/Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXdlSaHK62znKRG9iyUfYdqXrGRMXhruQ42gzsmoZbOErP6oUt9X3bgix0K9wo9V2l9fxpK0R3NoSI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwEAglgt0C0uG7XPg5izmWTyuP52v6hax7dPZfrTBx2Q1myN4D6
	/y2XveoVLOKN55WWH3weRG3WSxIYlQJWwgikzIIETBegmjuQpskKEWkriSsoirI=
X-Gm-Gg: ASbGncvJ/rmYUoqqX+uCEqH1i6kyzfYACHFk2AGQ0ddB1gcnDIbUGk+nAE3tTuh0t6j
	XVl7W6mJ5MuHedhkHDlzAaoXOIeHRF+PXiuWZ94EVpiC5no7XW1m5DRUkhw+fL6B1MQEgDe8+dr
	jcgzSp8Aox2MaLSEnnO0M++fw0XpvVlgsfQKyYv+9kR2UFnLm2eOamA4OwlUQ/xY0f4cRfpDFxk
	t8y7/kN1OH8aY3B4A9g7B2IvD6vpKS3v26nWaZEmQB1hFv0DlQCSpOghlwl8ykUnLHx2ZwyWJFw
	axzLrQVXtnQm7vaq/0JLqZ9kiRj7JTraM4Ul4UAdhcu5C05YTg86tyAR4Sod
X-Google-Smtp-Source: AGHT+IE5rRNC75MFtRNKzdS288HbyuZMTD2nZQBhaznTRZ3kRoPBwHGrzOWpkgGI+7InsS8Jm3kQ6Q==
X-Received: by 2002:a05:6000:1846:b0:39a:cd84:a77a with SMTP id ffacd0b85a97d-39efbae005amr10068227f8f.37.1745310365805;
        Tue, 22 Apr 2025 01:26:05 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:3382:ef90:9fbe:20e3:2fc3:8d19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43314fsm14735392f8f.39.2025.04.22.01.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:26:05 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 0/3] Move duplicated instructions macros into asm/insn.h
Date: Tue, 22 Apr 2025 10:25:42 +0200
Message-Id: <20250422082545.450453-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_012607_547439_BF8CFF79 
X-CRM114-Status: UNSURE (   5.62  )
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

The instructions parsing macros were duplicated and one of them had different
implementations, which is error prone.

So let's consolidate those macros in asm/insn.h.

Alexandre Ghiti (3):
  riscv: Fix typo EXRACT -> EXTRACT
  riscv: Strengthen duplicate and inconsistent definition of RV_X()
  riscv: Move all duplicate insn parsing macros into asm/insn.h

 arch/riscv/include/asm/insn.h        | 205 ++++++++++++++++++++++++---
 arch/riscv/kernel/elf_kexec.c        |   2 +-
 arch/riscv/kernel/traps_misaligned.c | 137 +-----------------
 arch/riscv/kernel/vector.c           |   2 +-
 arch/riscv/kvm/vcpu_insn.c           | 128 +----------------
 5 files changed, 189 insertions(+), 285 deletions(-)

-- 
2.39.2


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
