Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2606BC61DC2
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 06:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HVzC1vDPUxAyjZ6vMPc9NE80FXx7Wmyl+N5orrW/+aw=; b=xxIlDAfsIjsDnk
	JjfVbZ7aqSNU+PdPjPmEkErBuZBXrcYygesyccftNCQkL4liUWSbd1CnnwQqgaw+jl19l8/Fpw9D3
	/FfyZGBiMinbOcFUCmnNWMnEUD1JvdfJQe+CIqBjIxJfVUECVV1FgYi+7zRH2jp2aPbysu6QVFEsX
	oDa1rslBIXna1PTrXQ54kXO+1v0IGnNct70ScbtpHkOlMJT2n+d9HwFR0JOILVqKPkiOXHSkDOQ/B
	eW3NUZA9F0eg1/HG/jQ4Ms1dGJmwFsJL8KtKLa/G0lK/OyB2TKYJ823nKqfNi9AFQMDMlNkcFw2wG
	uzHWmVKZcpRTltDAfgrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz7LS-00000001yRO-1eoC;
	Wed, 26 Aug 2026 06:42:46 +0000
Received: from [117.135.210.5] (helo=m16.mail.163.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz7LP-00000001yQi-19if;
	Wed, 26 Aug 2026 06:42:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=J5
	wmbMVjfWUBCfpN0Lp0qCoOGcsiprXR0qo1DrktL6I=; b=nHhrjsvwBUSCK4U7Zo
	14IX8BgmYz/ItK20Q3P7zRZeaPkt1JYLsDM85BYejRgvxoApM5qKzlNnbXkFBB/h
	EXFAIDDljjdqlmwLPseWnFwd27cRDikCbAeLk8OAP1ugD/ljcqCbUdWa0UXC2fY7
	iblWK/GFl7sqctbXmipdDPQ2Q=
Received: from thinkpadx13gen2i.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgBHDxyPio5qdUk4OQ--.40540S2;
	Wed, 26 Aug 2026 14:41:19 +0800 (CST)
From: Zongmin Zhou <min_halo@163.com>
To: anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: ajones@ventanamicro.com,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>,
	stable@vger.kernel.org
Subject: [PATCH] RISC-V: KVM: Fix sdata leak and stale snapshot_addr in snapshot_set_shmem
Date: Wed, 26 Aug 2026 14:41:17 +0800
Message-Id: <20260826064117.58029-1-min_halo@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: PygvCgBHDxyPio5qdUk4OQ--.40540S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AryUAF18AF4kGF4furykXwb_yoW8AFyxpF
	ZxCa4FqrWrAr1fK34avFWvgrWjvws5urs8Xr4xGa48Gr45GF1Fvwna9ry8WF4Ut3y8Xa9a
	qr4rZF98CFs0vrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jbUUUUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC0RAFsGqOipASBQAA3d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_234244_209047_B60E3EBA 
X-CRM114-Status: UNSURE (   9.54  )
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

From: Zongmin Zhou <zhouzongmin@kylinos.cn>

A guest may call SBI_PMU_SNAPSHOT_SET_SHMEM repeatedly. Each call
overwrites kvpmu->sdata without freeing the old buffer (memory leak),
and if a later kvm_vcpu_write_guest() fails, the error path frees
sdata but leaves snapshot_addr stale. A subsequent
SBI_PMU_COUNTER_START then passes the INVALID_GPA check and crashes
the host with a NULL buffer in kvm_vcpu_read_guest().

Fix this by clearing the previously installed snapshot area before
installing a new one, which keeps sdata and snapshot_addr consistent.
The SBI spec suggests a single invocation but defines no error code
for repeated calls, so KVM must tolerate them.

Fixes: c2f41ddbcdd756 ("RISC-V: KVM: Implement SBI PMU Snapshot feature")
Cc: stable@vger.kernel.org
Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
---
 arch/riscv/kvm/vcpu_pmu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 752f1014d633e7d67f69c27b72088ed560c187ac..14f73490f12cbc5a8547859f0d1bb1170d89403b 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -454,6 +454,14 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
 		}
 	}
 
+	/*
+	 * Clear any previously installed snapshot area to avoid leaking
+	 * the old sdata and to keep sdata/snapshot_addr consistent if
+	 * the re-install fails below.
+	 */
+	if (kvpmu->snapshot_addr != INVALID_GPA)
+		kvm_pmu_clear_snapshot_area(vcpu);
+
 	kvpmu->sdata = kzalloc(snapshot_area_size, GFP_ATOMIC | __GFP_ACCOUNT);
 	if (!kvpmu->sdata) {
 		sbiret = SBI_ERR_FAILURE;
-- 
2.34.1


No virus found
		Checked by Hillstone Network AntiVirus


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
