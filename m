Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21777C678DC
	for <kvm-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 14:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XrsnV4k6z5zXazD4qHytslSTjdOOpkw3iiV7i9l1A1I=; b=fZ7nqadXPq6oky
	MATKOj2lWP356iV2uPw7Q/CprsIrYUD6laPowHeHBnum0kg1WAVbMZ/TI+VwpyPkQ/0IO9Z3YE1Ny
	dZaEjvnMUHrXb0kAjzR08b0A9eo9wtcr/tcELpsLaABIiT1P9cHcvmQE5ywYJOBQk6YQt5dhhLahf
	JIMQTayQ6Ztpc0EjELl4V8DcKExtE8U3WZrVnASnBRqJERDqB0FzAwnacpGXvlCQHqv0ckaojz1WM
	++yObGd/LLkyK0zR1ogmx7tSn4yL4Qh5Fg6XoVvN0kABTGCKAyvArAkW8WwPyhJlKZyS3y+Mgb0EU
	wI7xqMuIaY8IDZa9QbSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMmh-0000000ACYb-3PRN;
	Wed, 11 Jun 2025 14:50:35 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPIG0-00000009Yu7-33Re;
	Wed, 11 Jun 2025 10:00:35 +0000
Received: from zq-Legion-Y7000.smartont.net (unknown [180.110.114.155])
	by APP-01 (Coremail) with SMTP id qwCowADHPdy2U0lo4lS+BQ--.28065S2;
	Wed, 11 Jun 2025 18:00:22 +0800 (CST)
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
Subject: [PATCH] RISC-V: KVM: Avoid re-acquiring memslot in kvm_riscv_gstage_map()
Date: Wed, 11 Jun 2025 17:51:40 +0800
Message-Id: <50989f0a02790f9d7dc804c2ade6387c4e7fbdbc.1749634392.git.zhouquan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowADHPdy2U0lo4lS+BQ--.28065S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WrW3trWfAFyrArWUXrW3GFg_yoW8JF43pF
	4xCF1DCr4Fg3ZI9ry2k3Wv9a9xCa95W3Z7Cr4UGrWYqrsxtrySqws5W397ZF13Jr48XFWx
	ZFn8XFWUZr4rGw7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9C14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7M4kE6xkIj40Ew7xC0wCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
	0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUBSoAUUUUU=
X-Originating-IP: [180.110.114.155]
X-CM-SenderInfo: 52kr31xxdqqxpvfd2hldfou0/1tbiBgwKBmhJLhCtlQAAsh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_030033_131873_6E15FCF1 
X-CRM114-Status: UNSURE (   7.56  )
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

The caller has already passed in the memslot, and there are
two instances `{kvm_faultin_pfn/mark_page_dirty}` of retrieving
the memslot again in `kvm_riscv_gstage_map`, we can replace them
with `{__kvm_faultin_pfn/mark_page_dirty_in_slot}`.

Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
---
 arch/riscv/kvm/mmu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 1087ea74567b..f9059dac3ba3 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -648,7 +648,8 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 		return -EFAULT;
 	}
 
-	hfn = kvm_faultin_pfn(vcpu, gfn, is_write, &writable, &page);
+	hfn = __kvm_faultin_pfn(memslot, gfn, is_write ? FOLL_WRITE : 0,
+				&writable, &page);
 	if (hfn == KVM_PFN_ERR_HWPOISON) {
 		send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,
 				vma_pageshift, current);
@@ -670,7 +671,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 		goto out_unlock;
 
 	if (writable) {
-		mark_page_dirty(kvm, gfn);
+		mark_page_dirty_in_slot(kvm, memslot, gfn);
 		ret = gstage_map_page(kvm, pcache, gpa, hfn << PAGE_SHIFT,
 				      vma_pagesize, false, true);
 	} else {
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
