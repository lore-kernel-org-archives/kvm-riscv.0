Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6771C10854D7
	for <kvm-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 09:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oOgKxe6F0m9N5FLQgE5G+xfgRYSBqHO2GOFcmqYgtV8=; b=xIqaOGw5dvvt0G
	/ZaOpAlaInmWw798MDikS/QPEJOiG5ow72mFuH8NBofwCU6tE/DW3R+SUnOxWxGUFFmWur0FYmpZd
	7E2Yt2M9P4xVKsulD2u9wnxLDamM6g1qwxW60uXLEGDW9g8bSXhlSUeQpzND5+WUSW4wllJvWsG3y
	FuYzYtZq/7vJRoP+Fy4+GdsC3GnH5qUmwmFFK5czk0rYH4ajybT3bxlb1/LnqRF9VvZROV4WfSUz9
	mZa/h3knaYtgOi3C1sDXfkSQPoXmi1+chSYDCIPEeA0H9QbS/7BPXOtcHyKq2bJkvxB7rHMrdnzgg
	KgkvO5+YuBk25d1ZIeTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2nEN-000000089AQ-3mU6;
	Wed, 18 Mar 2026 09:30:23 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2nEI-0000000899m-0fTi;
	Wed, 18 Mar 2026 09:30:22 +0000
Received: from fric.. (unknown [210.73.43.101])
	by APP-03 (Coremail) with SMTP id rQCowABnieCVcLppXb4CCw--.589S2;
	Wed, 18 Mar 2026 17:29:57 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>,
	Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: [PATCH] RISC-V: KVM: Fix double-free of sdata in kvm_pmu_clear_snapshot_area()
Date: Wed, 18 Mar 2026 09:29:56 +0000
Message-Id: <20260318092956.708246-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowABnieCVcLppXb4CCw--.589S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF43Wr1DArWfCw1xZr4fKrg_yoW5JFy5pr
	WDC3WkWrWFyFn7K342yanY9ry8trWYgrn3Kr1DWFy5Gr13KFZ5Zw4v9ryUWry3Z3yvqF9a
	yr40kFy8uFn0q3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUP014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Cr0_Gr
	1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67
	AK6r4fMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbyCJPUU
	UUU==
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiCQ4KCWm6Z5gnFwAAsY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_023018_592980_F23BBC38 
X-CRM114-Status: UNSURE (   8.29  )
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

In kvm_riscv_vcpu_pmu_snapshot_set_shmem(), when kvm_vcpu_write_guest()
fails, kvpmu->sdata is freed but not set to NULL. This leaves a dangling
pointer that will be freed again when kvm_pmu_clear_snapshot_area() is
called during vcpu teardown, triggering a KASAN double-free report.

First free occurs in kvm_riscv_vcpu_pmu_snapshot_set_shmem():
 kvm_riscv_vcpu_pmu_snapshot_set_shmem arch/riscv/kvm/vcpu_pmu.c:443
 kvm_sbi_ext_pmu_handler arch/riscv/kvm/vcpu_sbi_pmu.c:74
 kvm_riscv_vcpu_sbi_ecall arch/riscv/kvm/vcpu_sbi.c:608
 kvm_riscv_vcpu_exit arch/riscv/kvm/vcpu_exit.c:240
 kvm_arch_vcpu_ioctl_run arch/riscv/kvm/vcpu.c:1008
 kvm_vcpu_ioctl virt/kvm/kvm_main.c:4476

Second free (double-free) occurs in kvm_pmu_clear_snapshot_area():
 kvm_pmu_clear_snapshot_area arch/riscv/kvm/vcpu_pmu.c:403 [inline]
 kvm_riscv_vcpu_pmu_deinit.part arch/riscv/kvm/vcpu_pmu.c:905
 kvm_riscv_vcpu_pmu_deinit arch/riscv/kvm/vcpu_pmu.c:893
 kvm_arch_vcpu_destroy arch/riscv/kvm/vcpu.c:199
 kvm_vcpu_destroy virt/kvm/kvm_main.c:469 [inline]
 kvm_destroy_vcpus virt/kvm/kvm_main.c:489
 kvm_arch_destroy_vm arch/riscv/kvm/vm.c:54
 kvm_destroy_vm virt/kvm/kvm_main.c:1301 [inline]
 kvm_put_kvm virt/kvm/kvm_main.c:1338
 kvm_vm_release virt/kvm/kvm_main.c:1361

Fix it by setting kvpmu->sdata to NULL after kfree() in
kvm_riscv_vcpu_pmu_snapshot_set_shmem(), so that the subsequent
kfree(NULL) in kvm_pmu_clear_snapshot_area() becomes a safe no-op.

This bug was found by fuzzing the KVM RISC-V PMU interface.

Fixes: c2f41ddbcdd756 ("RISC-V: KVM: Implement SBI PMU Snapshot feature")
Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
---
 arch/riscv/kvm/vcpu_pmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index e873430e596b2..ac1b9a91a19db 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -441,6 +441,7 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
 	/* No need to check writable slot explicitly as kvm_vcpu_write_guest does it internally */
 	if (kvm_vcpu_write_guest(vcpu, saddr, kvpmu->sdata, snapshot_area_size)) {
 		kfree(kvpmu->sdata);
+		kvpmu->sdata = NULL;
 		sbiret = SBI_ERR_INVALID_ADDRESS;
 		goto out;
 	}
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
