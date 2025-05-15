Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9148C2D0CD
	for <kvm-riscv@archiver.kernel.org>; Thu, 15 May 2025 22:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+ZtP/r++LLs2MJOk0LTF6effowSns6yZENg1F4KDLZI=; b=qzm/5WodGQzGim
	5E7uxyW3CZ+uOL9PIEh7oqAN0giy2rJU8Pxuwy8ojYNf+BW+mQhKv8CRASB4utXUkGkC5nHFMluLz
	+VUWM4unduL9WgLWEB1ebZzAHvCr9wnnr/nUDbWfoGyHTI7C5NAsTf+js9/l17/UBZmBPq+pAxwOI
	31ruJMfIRy1ylpQrVlg2clBD/Pbd2QOqOGnDbY8Vd8jADArv/phLihygryD2GK9FopjZxbkYiNvy+
	3fYNgi4eZ9xalIqMSoxAtjmnemvzG0iCno33OjjETvdHwc0IrLanMOJZPGzB/p1x9vCKCcOZeTKXB
	w2Rvy4KtzBHMfrw13+3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFgiV-00000001x9I-1cK2;
	Thu, 15 May 2025 22:06:15 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFgiQ-00000001x7v-1NZa
	for kvm-riscv@lists.infradead.org;
	Thu, 15 May 2025 22:06:13 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2317d94c9cdso14495165ad.2
        for <kvm-riscv@lists.infradead.org>; Thu, 15 May 2025 15:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747346769; x=1747951569; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pKEzAEjPYjOvvo8wW1NKB/AseRp560F6iFtwwKSA2eo=;
        b=nasvshqa7jts2G9SX8bVkE2kueTIw+JW9g/7ISxoEmshFpaOu7buRDqVAtoh6VDgPe
         byzrYe70IFo5rCCFa9Yc9y/Scloxr198gtZFTeurtSkcyJNyo6ng6+x9pmkww4yayZCS
         Ce+CMWYQB208JLpy31KA6cGYJGu7Ae2RM3DvfmmUIJ3Tim/kOdZWTwLbba0+ZOuQ7wNk
         u/ssYK8dUwLK6HU8uiD4DuFqb+LQot+FHO2D5MjeS3OcSNF2gTraDjIbmzxecFrcOrfx
         28zR7NOflhaXLA6QIT+hqVfUrP9K9ks1gHSA86Zd7wzDMwJGaTpwTqhyhExzAwRbVSoU
         BeUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747346769; x=1747951569;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pKEzAEjPYjOvvo8wW1NKB/AseRp560F6iFtwwKSA2eo=;
        b=h9Odgn8gO6V50mZBfkaeJGXFOO9XYpmY1aCWcjkRKaNPix8I1EFXPLRUbjFbkWmhsI
         zy/twx+JMcD6k9ry8gqCF6uCvcDMsBuHCufHfP2sN8BC4wkGLEazFWUkKNW9LTguNDGj
         I/EKkHPvciparOGCsEFTDvXl9/YJzWug7+w28/7KSPxT6jZXQ2HgZdRRZIxf5RXRCY1G
         Ji+/y2A14aYAzo0X7j1PRjUrWWdBbUZsNxgH7XA2XYffYNGK5wvOE6fgpl59Fpa0TqCs
         HnEe7VqKuwDuVa7raY53Ad4ehpal+1myYkiNxJBjERJp/81trBX4olVD1WpJmnOkvXAA
         qlUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMxk/BwaQBDJ+bPcIA+KCZW2LMxfPS3MDC+vGcHiksfaiZJh3xmCyz9fFR0BGjHK0MadznbCR0ghs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxNp2vKFl0DCEpSFHlxvTR5aVdw4DOikuG6OapuSBnAi1T0FYTv
	r6orCJg4LYZ8qIcmVEEwMc6yZT5Y/yxluAReAvYT/MwUO4VbSvcqh3rvN20MDHZW7E6JvHmtQvB
	nAEiM
X-Gm-Gg: ASbGncvf5qo7kwbw2FPVd3tAyuEwZQ/i6EtyYGG8X0QqvpRI4Gul1WDhhVKURLD1je0
	BLbLZUfU2E/Cir9xKxk+4xwfj2GNzlWuzTuKdcKUHbrSY0XNjo3mh08m3rd/NXPB9sx3p6dnzSw
	eNa5E6fdGJfJuA/NFVuMe/+BkX+7lYTPkIOxMqWWQMWks77yKMZteq6jssFuOOm0RUbe1JrRjaJ
	FBOtOpKgjIwqri8auXeQ/7VQgHl+wspiAOyFG3G5mr1yclKfZRBQTcVmem5lFSEywZ+/GRxjv38
	UuAAnxm2T1TEdairlewj1jK2RqQQe0D1e/9O2cmtrAZd+rfmzUA53laSij19TGa+
X-Google-Smtp-Source: AGHT+IFiKNNYtzCEg6C6XYe7DP0nZARy3KIK4XDqNnkJzROZ4X9NmluwSJ7FFKC6yeImxQGIHZ2cIQ==
X-Received: by 2002:a17:902:e805:b0:22c:33e4:fa5a with SMTP id d9443c01a7336-231d43d9c05mr11341725ad.9.1747346769141;
        Thu, 15 May 2025 15:06:09 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed25a9sm2470515ad.223.2025.05.15.15.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 15:06:08 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 15 May 2025 15:06:05 -0700
Subject: [PATCH v2] RISC-V: KVM: Remove scounteren initialization
MIME-Version: 1.0
Message-Id: <20250515-fix_scounteren_vs-v2-1-1fd8dc0693e8@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAExlJmgC/32NQQ6CMBBFr0JmbQ0tqYgr72EIwWEqs7AlHWw0p
 He3cgCX7+f/9zcQikwCl2qDSImFgy9gDhXgPPoHKZ4Kg6mNra1ulOP3IBhefqVIfkii3DSdT8Z
 abO8tlN0SqZR2560vPLOsIX72i6R/6T9b0kor1M6a0XUNtt01cgrCHo8YntDnnL+d7uw+tQAAA
 A==
X-Change-ID: 20250513-fix_scounteren_vs-fdd86255c7b7
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_150610_406940_347A55A1 
X-CRM114-Status: UNSURE (   8.82  )
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

Scounteren CSR controls the direct access the hpmcounters and cycle/
instret/time from the userspace. It's the supervisor's responsibility
to set it up correctly for it's user space. They hypervisor doesn't
need to decide the policy on behalf of the supervisor.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Changes in v2:
- Remove the scounteren initialization instead of just setting the TM bit. 
- Link to v1: https://lore.kernel.org/r/20250513-fix_scounteren_vs-v1-1-c1f52af93c79@rivosinc.com
---
 arch/riscv/kvm/vcpu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 60d684c76c58..fa3713b5a41b 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -146,9 +146,6 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	if (kvm_riscv_vcpu_alloc_vector_context(vcpu, cntx))
 		return -ENOMEM;
 
-	/* By default, make CY, TM, and IR counters accessible in VU mode */
-	reset_csr->scounteren = 0x7;
-
 	/* Setup VCPU timer */
 	kvm_riscv_vcpu_timer_init(vcpu);
 

---
base-commit: 01f95500a162fca88cefab9ed64ceded5afabc12
change-id: 20250513-fix_scounteren_vs-fdd86255c7b7
--
Regards,
Atish patra


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
