Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4ABAFC5911
	for <kvm-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 08:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=802/U4AmQPDsO7Pr9XpsHIGdfb3FW0zJEYYvK0l2Ceo=; b=LWYXAytlEa1eLo
	PlVs7+kvocgsLI9nvHzKLLQM0gU0rley564+UOxTpBG8sYJMNW3HJ6p48FzR2DfZbxiNGpyo8M4IX
	82MyGZm7RKIZvFgkE15wWHNNvVmKZ8a/ovZMDC8IeJQkCUMtrlim/RGxO6x93euVzrcmdNyJizg6m
	Qm/1Db1roaR7REoAEnIiSCfPfDFq/pEOLudNgYo/haSt9gT2T256wyhTmLe1duYaCLWmAP3nd7qOv
	DY6AxMlLQCQFAlCU7yo5eysGx1CRVrtO7muhgpkYsXf2yBoQ14JPz94g07yVkIGJXUOstL6IGPMfK
	Zrs0MsupM0JDcbnzX87w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvWns-00000005etZ-18XB;
	Thu, 26 Feb 2026 08:33:00 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvWnl-00000005eor-1los;
	Thu, 26 Feb 2026 08:32:57 +0000
Received: from fric.. (unknown [210.73.43.101])
	by APP-01 (Coremail) with SMTP id qwCowAB3HWkjBaBpUDDFCA--.13513S2;
	Thu, 26 Feb 2026 16:32:36 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	kvm@vger.kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>
Subject: [PATCH v8 0/3] RISC-V: KVM: Validate SBI STA shmem alignment
Date: Thu, 26 Feb 2026 08:32:31 +0000
Message-Id: <20260226083234.634716-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowAB3HWkjBaBpUDDFCA--.13513S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Gw4DZFW8ZFyDCr4UJFy5Jwb_yoW8Jr4rpa
	93Ca4FgFy8JayxA3Z3Aw4ktryfWw48CrsFyw17t342yayUKFy8trsrKFWUAa43GF1kXFs0
	va4xKa4ruF98ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBF14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
	rcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU6c_3UUUUU=
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiCQ4KCWmf1uCqDAAAsi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_003253_835113_F0056ABE 
X-CRM114-Status: UNSURE (   5.46  )
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

Patch 2 refactors existing UAPI tests from steal_time_init() into
a dedicated check_steal_time_uapi() function for better code organization,
and adds an empty stub for RISC-V.

Patch 3 fills in the RISC-V stub with tests that verify KVM correctly
enforces the STA alignment requirements.

Jiakai Xu (3):
  RISC-V: KVM: Validate SBI STA shmem alignment in 
    kvm_sbi_ext_sta_set_reg()
  KVM: selftests: Refactor UAPI tests into dedicated function
  RISC-V: KVM: selftests: Add RISC-V SBI STA shmem alignment tests

 arch/riscv/kvm/vcpu_sbi_sta.c                 | 16 ++--
 .../selftests/kvm/include/kvm_util_types.h    |  4 +
 tools/testing/selftests/kvm/steal_time.c      | 84 +++++++++++++++----
 3 files changed, 83 insertions(+), 21 deletions(-)

-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
