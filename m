Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E917C61DB2
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 11:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m89YrJfTRXlKbA7LjRa502A6qBYv4qkVgwfEneYGDJE=; b=1hC1bRG68EC546
	xjQcC3l/LZp0hg5GBAz8Ydkcu2H0QcerSGiqocNh6xfYJHTLhvWSvq9NWOnuBQI3bCk7dX1uH0j3K
	Y1C0vmKO8l+i1dcSA6m4bnzLqX741AK7mHqZa3245bHQ1TgwrlGUGxorkAP/ro/aFTY4dhpIgj9fp
	ODp4HMxAb6dCE0Fos8yYUHm7suM3egZuqVU0+9i8/exb1/K17SquUBWc8M8UTm/6dub52Yk04Z1uO
	XDy3vsU59/+SVAYmTmosyBuznTwZo9AAL1ObS6P6VH8hILvfFaIO04nbhftN+FDLAFa+jjlF0+f+D
	SNYJpUQOZbf2IQadLcEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2k7-0000000GEf7-42CI;
	Fri, 13 Jun 2025 11:38:43 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2k4-0000000GEea-0z5z;
	Fri, 13 Jun 2025 11:38:42 +0000
Received: from zq-Legion-Y7000.smartont.net (unknown [180.110.114.155])
	by APP-03 (Coremail) with SMTP id rQCowAC3CFG2DUxo0Ak5Bg--.60443S2;
	Fri, 13 Jun 2025 19:38:32 +0800 (CST)
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
Subject: [PATCH 0/2] RISC-V: KVM: Enable ring-based dirty memory tracking
Date: Fri, 13 Jun 2025 19:29:48 +0800
Message-Id: <cover.1749810735.git.zhouquan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowAC3CFG2DUxo0Ak5Bg--.60443S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZw47ZryxGFWUZw18ArW3GFg_yoWxAFbEk3
	y8J397JrWxZa18XFW7Xan5XFWDKayfK34DXF1YvF15Kr1Dur47Ga1kZr1qvrWUCrs8X3sI
	yF4fZFySq347KjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbTAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwAKzVCY07xG64k0F24lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoPEfDUUUU
X-Originating-IP: [180.110.114.155]
X-CM-SenderInfo: 52kr31xxdqqxpvfd2hldfou0/1tbiBg0MBmhL72JrpwAAsj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_043840_631156_E2A81399 
X-CRM114-Status: UNSURE (   5.38  )
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

Enable ring-based dirty memory tracking and add some
common KVM tests for riscv.

Quan Zhou (2):
  RISC-V: KVM: Enable ring-based dirty memory tracking
  KVM: riscv: selftests: Add common supported test cases

 Documentation/virt/kvm/api.rst                 |  2 +-
 arch/riscv/include/uapi/asm/kvm.h              |  1 +
 arch/riscv/kvm/Kconfig                         |  1 +
 arch/riscv/kvm/vcpu.c                          | 18 ++++++++++++++++--
 tools/testing/selftests/kvm/Makefile.kvm       | 12 ++++++++++++
 .../selftests/kvm/include/riscv/processor.h    |  2 ++
 tools/testing/selftests/rseq/rseq-riscv.h      |  3 +--
 7 files changed, 34 insertions(+), 5 deletions(-)

-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
