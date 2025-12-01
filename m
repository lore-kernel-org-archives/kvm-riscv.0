Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2394DCFD376
	for <kvm-riscv@archiver.kernel.org>; Mon,  1 Dec 2025 01:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X2EJ8/VJ7llcbw12x+wlHxqA+O+Uc2pHQMu6NZHdml0=; b=PKRbpa1fixGB1z
	e4dL4HAbsKYXgrRuRkBumZSeGviTfpJHQuPshssp6NVIKoP/ZlIXN6lsKWnJxWHy8bJkyVB6efCkR
	kUeQihRuHYMvK9xpN79GJvmvzbTR0J/RegWz0p81JDY7GmSbwG1gGEaQKexyikIK8AnrKnF2u+mPG
	z862U5+2RsRjOzPZBwJxjUpC2DEvamjpXLnfvjsbYKIhu2bu5f/nhLucTL6c/O6NIu2sjYn4X8KPZ
	PqoICEFoZl4+eJUL0C5eIpf5M+7DbETI1yssSdCPyQYOrV8Zeovpjvd4cqK8VUGFbph93tMlneG3a
	UsEmu4nzfFtg99NfcN+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPszD-00000002m6B-1nkc;
	Mon, 01 Dec 2025 01:45:55 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPsz8-00000002m5h-3mv9;
	Mon, 01 Dec 2025 01:45:53 +0000
Received: from zq-Legion-Y7000.. (unknown [121.237.244.238])
	by APP-01 (Coremail) with SMTP id qwCowADnfMxE8yxpRt2vAg--.19616S2;
	Mon, 01 Dec 2025 09:45:41 +0800 (CST)
From: zhouquan@iscas.ac.cn
To: anup@brainfault.org,
	ajones@ventanamicro.com,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH 0/4] RISC-V: KVM: Add Zicfiss/Zicfilp support
Date: Mon,  1 Dec 2025 09:28:04 +0800
Message-Id: <cover.1764509485.git.zhouquan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowADnfMxE8yxpRt2vAg--.19616S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtFWDJFyDKr1UJr1rKr13CFg_yoWkAFb_Cr
	WxJ3s7u34xJFZ7KF90vwn3WFWDKrWrtF98tw17Xr17WFnrur13Xw4Iq3Wjqr1jyr15Xa93
	ArZ5XrZ2q34j9jkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb6xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7M4kE6xkIj40Ew7xC0wCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_Kw
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j
	6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64
	vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_
	Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0x
	vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUfWrAUUUUU=
X-Originating-IP: [121.237.244.238]
X-CM-SenderInfo: 52kr31xxdqqxpvfd2hldfou0/1tbiDAYDBmks7K0Z0AAAsC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_174551_316390_693342AF 
X-CRM114-Status: UNSURE (   4.62  )
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

From: Quan Zhou <zhouquan@iscas.ac.cn>

This patchset is based on `riscv control-flow integrity for usermode` [1].
Add Zicfiss/Zicfilp [2] and sbi fwft [3] support for riscv kvm.

[1] - https://lore.kernel.org/all/20251112-v5_user_cfi_series-v23-0-b55691eacf4f@rivosinc.com/
[2] - https://github.com/riscv/riscv-cfi
[3] - https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-firmware-features.adoc

Quan Zhou (4):
  RISC-V: KVM: Allow zicfiss/zicfilp exts for Guest/VM
  RISC-V: KVM: Add support for software check exception
  RISC-V: KVM: Add suuport for zicfiss/zicfilp/svadu FWFT features
  KVM: riscv: selftests: Add zicfiss/zicfilp/svadu and SBI FWFT to
    get-reg-list test

 arch/riscv/include/asm/csr.h                  |   1 +
 arch/riscv/include/asm/kvm_host.h             |   3 +-
 arch/riscv/include/uapi/asm/kvm.h             |   5 +
 arch/riscv/kvm/vcpu.c                         |   6 +
 arch/riscv/kvm/vcpu_exit.c                    |   3 +
 arch/riscv/kvm/vcpu_onereg.c                  |   2 +
 arch/riscv/kvm/vcpu_sbi_fwft.c                | 129 ++++++++++++++++++
 .../selftests/kvm/riscv/get-reg-list.c        |  26 ++++
 8 files changed, 174 insertions(+), 1 deletion(-)

-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
