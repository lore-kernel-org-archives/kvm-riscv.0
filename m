Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5E7C021AA
	for <kvm-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 01:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:To:Subject:Cc:Mime-Version:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SSRqP2ZK94JhdrlZ3Gy19dfaUVs5dHM6EyE9BH+wjRI=; b=fKbAXDMV3sC/HG
	i4BOIDuqJM1mJ89VxNVQYu42ZNQcxVY4LgwaELJnQ3hezCx4enkml4PeBsgi8VMhBT+g17jUyRCTD
	4U/NpPmgzj+d5596CTfBd2emnVDwQDSLBXR/3F/D7Ku6yeYxd5Eqt2aITjjsiCTKBDl+fcVcyRdrX
	GjdV+Zed+gpJLNGHWSwDD192UUzYCLiZja/92yKbcZPmzfpgVQ4xi2ST/3XDVr3/x/tH51c/Vagjr
	Y+DdTiQOUWK+9sBlRzXuB1k3Rm6ZxcZbxwuvgQQ4sDsDEVc7m8fl76ltQXPeCKtCFS8Xi8ciTs0Fo
	oXow7ESI/ovxfpjfwNhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkZIx-0000000AaSS-3Eb7;
	Wed, 19 Feb 2025 01:55:15 +0000
Received: from va-2-37.ptr.blmpb.com ([209.127.231.37])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkZIv-0000000AaQs-1MXq
	for kvm-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 01:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1739930102;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=cQPgSHvwewybXbQoyDuJoBkKJD1qHn20v1BZRnO8+8A=;
 b=k26LlSm53NadsMNE5zfLry2epZI+oanW9H3a21Xekfv6Spri6d4DXVSDqGl6sev9d4K7/j
 Wc+2zkusSy7LnQH7u8Dn2A7N8FKdHx6cbUv4eJpy/f9emjVuKVJ4cRnY6jE5i+OS91A1rr
 f8xrm1eJQUgI6WNgXT+YwCEYeM9Yz61b9FOWf5MvxrsUCN0UZqJseaOxNm8csb4HTvhzz+
 A+RoH3xxHEPuhVUahpK9RQIuuH51WR9u12NiOLrHKqZRL/cUoZYAY3H78ldB7ZXdRNO03W
 LYmRErJHmKZCn02bEZGYS4BchKR9+ZF7So/EVbsdTTzlx+j+8cLfh9ROIytMMw==
X-Mailer: git-send-email 2.46.2.windows.1
Message-Id: <20250219015426.1939-1-xiangwencheng@lanxincomputing.com>
Mime-Version: 1.0
Received: from localhost.localdomain ([222.128.9.250]) by smtp.feishu.cn with ESMTP; Wed, 19 Feb 2025 09:54:59 +0800
X-Lms-Return-Path: <lba+267b539f4+acd4cc+lists.infradead.org+xiangwencheng@lanxincomputing.com>
Cc: <ajones@ventanamicro.com>, <xiangwencheng@lanxincomputing.com>, 
	<kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<atishp@atishpatra.org>, <paul.walmsley@sifive.com>, 
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
Subject: [PATCH] riscv: KVM: Remove unnecessary vcpu kick
X-Original-From: BillXiang <xiangwencheng@lanxincomputing.com>
To: <anup@brainfault.org>
From: "BillXiang" <xiangwencheng@lanxincomputing.com>
Date: Wed, 19 Feb 2025 09:54:26 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_175513_423014_F7F1285F 
X-CRM114-Status: UNSURE (   8.90  )
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

Thank you Andrew Jones, forgive my errors in the last email.
I'm wondering whether it's necessary to kick the virtual hart
after writing to the vsfile of IMSIC.
From my understanding, writing to the vsfile should directly
forward the interrupt as MSI to the virtual hart. This means that
an additional kick should not be necessary, as it would cause the
vCPU to exit unnecessarily and potentially degrade performance.
I've tested this behavior in QEMU, and it seems to work perfectly
fine without the extra kick.
Would appreciate any insights or confirmation on this!
Best regards.

Signed-off-by: BillXiang <xiangwencheng@lanxincomputing.com>
---
 arch/riscv/kvm/aia_imsic.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index a8085cd8215e..29ef9c2133a9 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -974,7 +974,6 @@ int kvm_riscv_vcpu_aia_imsic_inject(struct kvm_vcpu *vcpu,
 
 	if (imsic->vsfile_cpu >= 0) {
 		writel(iid, imsic->vsfile_va + IMSIC_MMIO_SETIPNUM_LE);
-		kvm_vcpu_kick(vcpu);
 	} else {
 		eix = &imsic->swfile->eix[iid / BITS_PER_TYPE(u64)];
 		set_bit(iid & (BITS_PER_TYPE(u64) - 1), eix->eip);
-- 
2.46.2

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
