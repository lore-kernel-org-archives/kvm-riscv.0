Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BAFC71157
	for <kvm-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 13:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ln+fDrRxQpE7BC8sRQMIyHB2ADCwGqYMhk3u0WVTkBU=; b=z4jm/LUNfkZbHl
	eNmNwi5zsRMLj967wEwOF0yRelIdJThzGyBA+NJELzZEPGjbt6b6ZDetEAzdRCPL3Z5G6o1TjAgx+
	eOBpRzE1r08R58KH2olZHPMRsnDx9j1rJa40M2x7aRkQtPbZlVc3FYMG8a8bC8ySO3d3NBE0GUHpe
	FnFH6For1kZDPPB73uJh+03LUUMwC5RbdPCPtYW5cwb1ZLWiA3i6I1RO2NW4PLN1NhXLvvXurJqf4
	EB9htodNLiauFyfLIPkt2OIposqH4XH5MjMZF8DO8sMlYWysyZpsgAv4Q88PPRPkGfD4Dd3LpoJ+Z
	Dbk+YLbUBq/iTY7NgsQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWJM-00000007LR7-3Ncm;
	Tue, 17 Jun 2025 13:25:12 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWDM-00000007K0o-0YbK;
	Tue, 17 Jun 2025 13:19:01 +0000
Received: from zq-Legion-Y7000.. (unknown [180.110.114.155])
	by APP-05 (Coremail) with SMTP id zQCowADXYRA+a1FodSQ9Bw--.11058S2;
	Tue, 17 Jun 2025 21:18:54 +0800 (CST)
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
Subject: [PATCH 0/5] RISC-V: KVM: Allow zicop/bfloat16 exts for guest
Date: Tue, 17 Jun 2025 21:10:10 +0800
Message-Id: <cover.1750164414.git.zhouquan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowADXYRA+a1FodSQ9Bw--.11058S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFyxJr4fWF13Cw45urykZrb_yoWxZwc_CF
	WrZrZ7Jw12qayjgFW2y3Z5tFy8Ja9akFy7Xa12vr1UuFnrWrWUZw1xta4UGr48uw45Xw12
	yrn5uFWSkr1YqjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbTAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwAKzVCY07xG64k0F24lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOdgADUUUU
X-Originating-IP: [180.110.114.155]
X-CM-SenderInfo: 52kr31xxdqqxpvfd2hldfou0/1tbiBgsQBmhRLE-QtQAAsk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_061900_533884_D46E1DD6 
X-CRM114-Status: UNSURE (   3.60  )
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

Advertise zicop/bfloat16 extensions to KVM guest when underlying
host supports it, and add them to get-reg-list test.

Quan Zhou (5):
  RISC-V: KVM: Provide UAPI for Zicbop block size
  RISC-V: KVM: Allow Zicbop extension for Guest/VM
  RISC-V: KVM: Allow bfloat16 extension for Guest/VM
  KVM: riscv: selftests: Add Zicbop extension to get-reg-list test
  KVM: riscv: selftests: Add bfloat16 extension to get-reg-list test

 arch/riscv/include/uapi/asm/kvm.h             |  5 ++++
 arch/riscv/kvm/vcpu_onereg.c                  | 19 ++++++++++++++
 .../selftests/kvm/riscv/get-reg-list.c        | 25 +++++++++++++++++++
 3 files changed, 49 insertions(+)

-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
