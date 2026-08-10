Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C26C5AD4E
	for <kvm-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 05:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sAwOKhyfLSmkraMxW/Wfuvbuy1o1UfSQIXXtfccTV2k=; b=aqxiGdQDKaxFhP
	5NXlD/u5ix2wjEVkTjL6QtKU8kOrai88mnHl8XwTNtURW1odIhHpYg9n+diVMKYWTcOSgExMdenbq
	g8ySBVSBv/l7gYoxKGgIxJBDaHysf4k+IFVFoeK1iSbv/UFZiUwIIZdqGcD13ouShnS62Sufj6wuc
	7jEHGIy8QL0jwzkDibVSxcfk7b7itXJjeCR5oF82qkgGBpTMVGk4KqpGZ0Zbz53wSB0+nspF8T1Il
	wLuUcoLUUMnIbQHCW8CI2DHODMi4Xurl7grugR5CCL1WUxW8/m5YdshvEJ5UZY/px8RTaDvFFSi3n
	TnCqiDu2BsEMkOCsAAjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtIMt-0000000B20A-3Kzc;
	Mon, 10 Aug 2026 05:16:11 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtIMq-0000000B1yk-0ijD;
	Mon, 10 Aug 2026 05:16:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=hFX9Zm9qAMWPdih3CERXtHLvTmlcchQZ9j
	xsR7LXPE4=; b=n56YuxBXGtMCOtd3MyDtEgK80d6kbuKQk0cyStl3KuRiFHs8Yr
	+OsDkz/VcmEwdY744jwQUoqm5hnPrmh62oihHi24uCPGpuUVRV3RH5+79zh2NWWS
	qWOV0jLZAoR625gM4/dgwjN4jgCJi9+07URkWnHRtU31vhc8fTxMbTj84=
Received: from ultrarisc.com (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnEkOZXnlq2JYWAA--.18693S3;
	Mon, 10 Aug 2026 13:16:19 +0800 (CST)
From: Xie Bo <xb@ultrarisc.com>
To: Anup Patel <anup@brainfault.org>,
	kvm-riscv@lists.infradead.org
Cc: Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xie Bo <xb@ultrarisc.com>,
	stable@vger.kernel.org
Subject: [RESEND PATCH 1/2] RISC-V: KVM: Release unused page after MMU invalidation
Date: Mon, 10 Aug 2026 13:15:43 +0800
Message-Id: <20260810051544.3953925-2-xb@ultrarisc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260810051544.3953925-1-xb@ultrarisc.com>
References: <20260810051544.3953925-1-xb@ultrarisc.com>
MIME-Version: 1.0
X-CM-TRANSID: AQAAfwAnEkOZXnlq2JYWAA--.18693S3
X-Coremail-Antispam: 1UD129KBjvJXoW7WFWrtr45Zry5Xw4UArWkZwb_yoW8AF15pF
	ZFka90vrWrtF4UZ347Aan29ry09ws2gw1fCryYq3sYvrsrtr1qqws5W3yxWF13Jr1kXayS
	vF4jqFW5CrWkK3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmm14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCF
	s4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
	1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
	JVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r
	1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1U
	YxBIdaVFxhVjvjDU0xZFpf9x0JUYg4DUUUUU=
X-CM-SenderInfo: l0e63zxwud2x1vfou0bp/1tbiAQAMB2p1VlUAFAAOsM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_221608_867851_FFEBF1BB 
X-CRM114-Status: UNSURE (   9.45  )
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

If an MMU invalidation races with a G-stage fault, the fault handler skips
installing the page but leaves ret set to zero. As a result,
kvm_release_faultin_page() treats the page as used and can unnecessarily
mark it dirty.

Track the invalidation retry separately and release the page as unused,
while preserving the existing return value so that the vCPU retries the
fault.

Fixes: 2ed90cb0938a ("KVM: RISC-V: Retry fault if vma_lookup() results become invalid")
Cc: stable@vger.kernel.org
Signed-off-by: Xie Bo <xb@ultrarisc.com>
---
 arch/riscv/kvm/mmu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 6035b5e..d189fd5 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -627,6 +627,7 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	int ret;
 	kvm_pfn_t hfn;
 	bool is_hugetlb;
+	bool unused = false;
 	bool writable;
 	unsigned int vma_pageshift;
 	gfn_t gfn = gpa >> PAGE_SHIFT;
@@ -719,8 +720,10 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 
 	write_lock(&kvm->mmu_lock);
 
-	if (mmu_invalidate_retry(kvm, mmu_seq))
+	if (mmu_invalidate_retry(kvm, mmu_seq)) {
+		unused = true;
 		goto out_unlock;
+	}
 
 	/*
 	 * Check if we are backed by a THP and thus use block mapping if
@@ -743,7 +746,8 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 		kvm_err("Failed to map in G-stage\n");
 
 out_unlock:
-	kvm_release_faultin_page(kvm, page, ret && ret != -EEXIST, writable);
+	kvm_release_faultin_page(kvm, page,
+				 unused || (ret && ret != -EEXIST), writable);
 	write_unlock(&kvm->mmu_lock);
 	return ret;
 }


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
