Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FEBCA0EED
	for <kvm-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 16:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OLHIYLSnV/z44ubTz86ivnUIEkrraPLO+KNM+ug++lU=; b=Gh5C0tpJdJU0V2
	F6/ydYC3q2ViIsrFG3tmJ848YENIrz9V3Rm6qSfqbiM4QTB0BDRaIQXhJ0jg/DvJ6csBVozBDruxg
	uhbhmA5nygi/sIqkZTsaqWtt9irpu2Cfnk46goK1rKP5hXaQuhfXMTlCBEFTX4sxb+RC6PYf7KlOA
	WJvNnhjNAUszZqD8qG43SezIQZTfhiqTTUqaIgO34bA0MLv7pY3LDr4VPeM2a8vRDUg7xMtdWEu07
	7kOWV9PZoU3L/y8/5nNOyveBekEgzd230r7e2EogHEwiRvM43vdX/UeozOetyD0S1beF50xf08rpz
	jaJyAMw5jGoelxVc7++g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uprFa-000000052up-1YV4;
	Sat, 23 Aug 2025 16:37:54 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqew-00000004xON-1UTS
	for kvm-riscv@lists.infradead.org;
	Sat, 23 Aug 2025 16:00:03 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-76e6cbb991aso2697397b3a.1
        for <kvm-riscv@lists.infradead.org>; Sat, 23 Aug 2025 09:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755964801; x=1756569601; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H24QVG/T3cxixN5Hjl4PI98/BCvc+2mgYT4CjAn1N5o=;
        b=j7up+h5dyQnh8jJz6fueYS4ngmCqgbIIVhNSm+thxyRj+hgdoyOfvk/+9t1XxQK3Dy
         iamsLt0gWg4TjpupzBV4AKFvmiv77pybw61/5D/FUcIOFgUYIXPhbZQnMISQFvWnS500
         R7kGSsC40LgUIKIIvIW5RePkdKvOgkAD89/4T3xan1I359Kca+S1i0XwD4vA9r2dV7MS
         D5H9dr5odzoCZlCKXhM3T3Ao/JGvYCAYKDzZ5m/qDzx43dfqPeEVzod3cRhJi+EAiN+T
         +KzdmIQA40LEmbUd0vMFsjFX93ax5msGadRxuQkPn1imh74mbIj9D5dBept32MJfGAGg
         etGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755964801; x=1756569601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H24QVG/T3cxixN5Hjl4PI98/BCvc+2mgYT4CjAn1N5o=;
        b=WQ5cBHS1as0ANYRWfGEfNWfrP1pUNVl8p7j4LiaY6RrLu32x2PCx4IiRSjVYXvyyQY
         evsHcR46nbpeBVK+Wj2mtkFhZfmzJgGZmdTqgI+JFhQuLB/Bk/nVpGG23kug5yN+sClK
         zDDEMhNm6vBjFTf1PmObdIJt+fywxALGwPDiC0FoN4sWaV3gD8RX+3GinOI55O3FX/E3
         wbmJROP+RdbhkM20zAb61XZpCKd9kM5rnjCCgnZiKQK4BHZkYesN4L08HB1V8wF5O7X5
         nupLVtvoVjkRM7v/3UyWZFKG30dnEWjXNJfKYdB0sCVcY+cyVO/0jvQCn8KFE5KPKLJR
         KhEA==
X-Forwarded-Encrypted: i=1; AJvYcCW/c0rxiMKCH/j2VECOJ2eKiDR2CxeYCV8cVNXpS3oO4jN9bv4hLTDb6qnhq/CIUEN+pvD//uSXnMo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2mlGZDiDmPvYydZK71KSOF64nImua7TATq4b6DvKfkt5mYIK2
	J+rtlcm2zY+J4oM8EcHcoELLMXFu08sv7rxOKCCunoFNYEZw7z0MECxoB9AiGcL7O1M=
X-Gm-Gg: ASbGncuNxa3nbYIeK8nTJM5I8k8NIt/M6YsyzaA+pPWkwsevyI+JRIX4k1Pni9IRP5+
	vxmB8OqGF/h0F5ne6pkz0NeZez2zedRRhuvVZVSNsOdwVI06PoS1hkiBl6IJS3gesaedCBYbKVp
	L2YFD6hdC9RK9lv0L/Cv2jz4NRr6+HqRgcg7ITIFIjBnQYao/Lx0CDuowSHV8YBZ87YpINxliNu
	D1NNPsSTsDDFQffuOjnyVxSsCuzWo9qgRPaEgXnl13ShW/QbNlOunkLkk4TARQP2KkAqSqfpFmX
	RPhJNj806frwRmVOkFSFK7GOxLKRKZFGw5AvJzF1YJoLkdFpt2F/IUyN7N2eyTeaez+ktwG6fM5
	jUieIRCQSbZ4jt3PeYftofwWNEeYEc1cfwSXsazP7RpzKPoBM/NbyLHT/l5bOZpzY7MUq1idr
X-Google-Smtp-Source: AGHT+IHHBn4yz0Tv2mtxye/b3d+njwhsYjSP/E2IAAVTTBKNql/cK/uY7eFReM62Y2BttpdFYMcwWg==
X-Received: by 2002:a05:6a20:1592:b0:23f:fe66:5d2a with SMTP id adf61e73a8af0-24340bce2c1mr9575921637.27.1755964800673;
        Sat, 23 Aug 2025 09:00:00 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77040214b81sm2804464b3a.93.2025.08.23.08.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 09:00:00 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 0/6] ONE_REG interface for SBI FWFT extension
Date: Sat, 23 Aug 2025 21:29:41 +0530
Message-ID: <20250823155947.1354229-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_090002_385449_484A2A9E 
X-CRM114-Status: UNSURE (   8.87  )
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

This series adds ONE_REG interface for SBI FWFT extension implemented
by KVM RISC-V. This was missed out in accepted SBI FWFT patches for
KVM RISC-V.

These patches can also be found in the riscv_kvm_fwft_one_reg_v3 branch
at: https://github.com/avpatel/linux.git

Changes since v2:
 - Re-based on latest KVM RISC-V queue
 - Improved FWFT ONE_REG interface to allow enabling/disabling each
   FWFT feature from KVM userspace

Changes since v1:
 - Dropped have_state in PATCH4 as suggested by Drew
 - Added Drew's Reviewed-by in appropriate patches

Anup Patel (6):
  RISC-V: KVM: Set initial value of hedeleg in kvm_arch_vcpu_create()
  RISC-V: KVM: Introduce feature specific reset for SBI FWFT
  RISC-V: KVM: Introduce optional ONE_REG callbacks for SBI extensions
  RISC-V: KVM: Move copy_sbi_ext_reg_indices() to SBI implementation
  RISC-V: KVM: Implement ONE_REG interface for SBI FWFT state
  KVM: riscv: selftests: Add SBI FWFT to get-reg-list test

 arch/riscv/include/asm/kvm_vcpu_sbi.h         |  22 +-
 arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h    |   1 +
 arch/riscv/include/uapi/asm/kvm.h             |  15 ++
 arch/riscv/kvm/vcpu.c                         |   3 +-
 arch/riscv/kvm/vcpu_onereg.c                  |  60 +----
 arch/riscv/kvm/vcpu_sbi.c                     | 172 +++++++++++--
 arch/riscv/kvm/vcpu_sbi_fwft.c                | 227 ++++++++++++++++--
 arch/riscv/kvm/vcpu_sbi_sta.c                 |  63 +++--
 .../selftests/kvm/riscv/get-reg-list.c        |  32 +++
 9 files changed, 467 insertions(+), 128 deletions(-)

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
