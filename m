Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCD6EA7950
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 01:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KLXeGUEUhZr77zUwEinYE0Gq8Qg90O3826YTNjhbsiE=; b=TYgz1gv/CqVdSm
	DXW7Qtcnmir+4hMThYSawDLL0UEcTMknLtkg6W1a9njBoFcn+Bgdvj9ySySV0eaBd0cR9Lt4JFxVC
	dAZkJhrtrK+QXnr41R5xx+Ym4oIrdWAVIJu5wbbXnvw3+QBl13NNM0HwfeO22Bi4DTpHKry+Z8ymq
	NHYHIt0Yj3aIM5Qd9aJZR2abpQh03cmbe8mYgrY9ZmmfHepsAAH6kXv8w0UK0j8d+Dy/6hhJU8f2X
	gMbUbc5KlgWPnTsG1TVt1GJmavYvrrksX22SpGjyEfWzrehVwE8nuUiv2xSGr5pKJfMLLIZkfuVnc
	cibu/hTru/v08WrTTsew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnnoA-00000009F3g-2tAA;
	Thu, 05 Feb 2026 01:05:22 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnno5-00000009F2M-365r;
	Thu, 05 Feb 2026 01:05:21 +0000
Received: from fric.. (unknown [210.73.43.101])
	by APP-03 (Coremail) with SMTP id rQCowACXt97A7INpzKW1Bw--.43975S2;
	Thu, 05 Feb 2026 09:05:04 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>
Subject: [PATCH v6 0/2] RISC-V: KVM: Validate SBI STA shmem alignment
Date: Thu,  5 Feb 2026 01:05:00 +0000
Message-Id: <20260205010502.2554381-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowACXt97A7INpzKW1Bw--.43975S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw4DZFW8ZFyDCr4UJFy5Jwb_yoWDKrgE9a
	4IyrZ8Xr4UZF42vFZ2kw4DXrWrKw4xG3ZFgF1jvF129rykZFWUW3Wkuw1YvFyUJw4rC3sx
	ZFsYv34furyY9jkaLaAFLSUrUUUU1b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbyAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2kKe7AKxVWUXVWUAwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY
	62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7V
	C2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0
	x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxV
	W8ZVWrXwCY02Avz4vE14v_KwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8
	JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
	AFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
	A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU
	0xZFpf9x0pR6yxiUUUUU=
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiDAcJCWmD6tsHrwAAs4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_170518_163062_059ABECF 
X-CRM114-Status: UNSURE (   5.70  )
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

This series fixes a missing validation in the RISC-V KVM SBI
steal-time accounting (STA) register handling.

Patch 1 validates the configured SBI STA shared memory GPA at
KVM_SET_ONE_REG, enforcing the 64-byte alignment requirement
defined by the SBI specification or allowing INVALID_GPA to explicitly
disable steal-time accounting. This prevents invalid userspace state
from reaching runtime code paths and avoids WARN_ON() triggers during
KVM_RUN.

Patch 2 adds RISC-V KVM selftests to verify the expected behavior,
ensuring that misaligned GPAs are rejected, aligned GPAs are accepted,
and INVALID_GPA correctly disables steal-time accounting.

Jiakai Xu (2):
  RISC-V: KVM: Validate SBI STA shmem alignment in 
    kvm_sbi_ext_sta_set_reg()
  RISC-V: KVM: selftests: Add RISC-V SBI STA shmem alignment tests

 arch/riscv/kvm/vcpu_sbi_sta.c                 | 16 ++++++---
 .../selftests/kvm/include/riscv/processor.h   |  4 +++
 tools/testing/selftests/kvm/steal_time.c      | 33 +++++++++++++++++++
 3 files changed, 48 insertions(+), 5 deletions(-)

-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
