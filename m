Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC990CA0EE4
	for <kvm-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 13:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xijoNeGxKCpl+mU4ksLVn668YzX9EZTlbeQ/b+rmvpQ=; b=iwQb+bCdqjjjxv
	Z/S3Q6DdTEFcqUtk/jSzCEPQG2akEDLD1TBR3DOsbGeIUtLivQxWu2h5jrW4PFH2HbQ6w/ZFhNiqI
	7fm/v6P+Ks0N1zSCF2whnuXi8Cai4yfY4aPqinEHL4oJzZmSQBotOQfjYzIeLCoUNP1Sg35eYxze0
	+aANez3HEzY8A51kFrQWiFZwEq/FvgDZ9LeXA+kes9HTW5vdBpheRQHqZIVw/KPUqikiyS3mrcln8
	7bkFVMOpxBJBRjZhgtE11JIhBt3XXCDUwii/CX7GcR6cDWPT8H54W3wycUSkVmDaJNzuArz0EPgwL
	Ypa75HcQNM9oi8+Q4eVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoiyl-0000000DpLt-1s0O;
	Wed, 20 Aug 2025 13:35:51 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoiQ9-0000000DhBn-07wN;
	Wed, 20 Aug 2025 13:00:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1755694798; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=XgpkwoPcHNm5bqngyKgaAijv3704PoYrCd7F3xEpnsE=;
	b=iwzNjPKfd3qF7JRHi/sTnpLV9nlq37F/fh7Hv9myKDzjQnX0U+i8fGUs1zuoShbzB8gdmkvHSJFSLsNuT/PfEpWEgDmhUyn1Dws+58PoQwhhj++IOyHW2sjshLXUihvTiOhHX9Uun2COUyvKdrYsgoH4K6VnEc6jcCb16bglsso=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WmCQaZ-_1755694794 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 20 Aug 2025 20:59:55 +0800
From: fangyu.yu@linux.alibaba.com
To: anup@brainfault.org,
	atish.patra@linux.dev,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: guoren@kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH v3 0/2] Fix hgatp mode settings within kvm_riscv_gstage_vmid_detect 
Date: Wed, 20 Aug 2025 20:59:50 +0800
Message-Id: <20250820125952.71689-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_060005_589425_8816CA78 
X-CRM114-Status: UNSURE (   4.60  )
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

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

According to the RISC-V Privileged Architecture Spec, when MODE=Bare
is selected,software must write zero to the remaining fields of hgatp.

So,use a valid mode when detecting vmids of the HW supported,meanwhile
remove unnecessary HGATP csr_read.

---
Changes in v3:
 - Add "Fixes" tag.
 - Involve("RISC-V KVM: Remove unnecessary HGATP csr_read"), which
   depends on patch 1.

Changes in v2:
 - Fixed build error since kvm_riscv_gstage_mode() has been modified.
---

Fangyu Yu (1):
  RISC-V: KVM: Write hgatp register with valid mode bits

Guo Ren (Alibaba DAMO Academy) (1):
  RISC-V KVM: Remove unnecessary HGATP csr_read

 arch/riscv/kvm/vmid.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
