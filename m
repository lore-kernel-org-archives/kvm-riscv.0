Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611A8EDB7DB
	for <kvm-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 09:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hIeo1N8fY28OYACBxfZZaJfWoDH19kdH3E6NY0AP8i0=; b=0vf+i7Ru5OtsF2
	gJ/R1l02dbF87FBWjkNFvlO/CmBl0pZySweTRlnIB510a8rOTrPMccz+sT6dxxxXLfqsHwLcPVJ/D
	OYrEU1DZRMYY+cJx71GTwHkmWLWEtVMGgaiurEw8IRDxoS2teF/CBKTbaojbo2LKoO1yv2+OZbfSO
	Qwj/9MCnBgteVW81tEAUS5JU1f60bGVcjfzm6IG5ZfIvQFg8GZMEUzmlIY0fP4SXMWNnujFI28Os0
	ySf2+FToGwZtwsMkR8Vac08DUFPxo5kKVDRBYCC1QkHxaAP27xWJOUS59tGuPKriAxs4zIsr0KMSn
	xBqbVRSOvlqoS1t28LdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA2Sq-00000006CZt-3EWu;
	Tue, 07 Apr 2026 09:11:16 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA2Sn-00000006CZM-26xm;
	Tue, 07 Apr 2026 09:11:15 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4fqgR83lWwz501bP;
	Tue, 07 Apr 2026 17:11:00 +0800 (CST)
Received: from szxl2zmapp06.zte.com.cn ([10.1.32.108])
	by mse-fl2.zte.com.cn with SMTP id 6379AjGQ039312;
	Tue, 7 Apr 2026 17:10:49 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxlzmapp04[null])
	by mapi (Zmail) with MAPI id mid12;
	Tue, 7 Apr 2026 17:10:52 +0800 (CST)
X-Zmail-TransId: 2b0669d4ca1c880-bd28c
X-Mailer: Zmail v1.0
Message-ID: <20260407171052241tmZDFGusMP_wlEsBVVtJo@zte.com.cn>
Date: Tue, 7 Apr 2026 17:10:52 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIDAvM10gUklTQy1WOiBLVk06IEh1Z2UgcGFnZSByZWNvdmVyeSBkdXJpbmcgZGlzYWJsZS1kaXJ0eS1sb2c=?=
X-MAIL: mse-fl2.zte.com.cn 6379AjGQ039312
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.133 unknown Tue, 07 Apr 2026 17:11:00 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 69D4CA24.001/4fqgR83lWwz501bP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_021113_738547_73F5F357 
X-CRM114-Status: UNSURE (   4.57  )
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

From: Wang Yechao <wang.yechao255@zte.com.cn>

When dirty logging is enabled, the gstage mappings are split into
4K pages to track dirty pages[1]. If the migration fails or is canceled,
in order to keep the VM's performance consistent with that before
dirty logging was enabled, It's need to recover the gstage huge page mappings
when dirty logging is disabled.

With this series, dirty_log_perf_test shows a decrease in the number of
vCPU faults:

$ perf stat -e kvm:kvm_page_fault \
/dirty_log_perf_test -s anonymous_hugetlb_1gb -v 1 -e -b 1G

Before: 524,819      kvm:kvm_page_fault
After : 263,211      kvm:kvm_page_fault

[1].https://lore.kernel.org/linux-riscv/CAK9=C2Vb73snLT0uEY=5S5dQc6VXc_u4S60+9+sCLpyXZnHTWA@mail.gmail.com/T/#t

Wang Yechao (3):
  RISC-V: KVM: Refactor kvm_arch_commit_memory_region()
  RISC-V: KVM: add tracepoints for guest page faults
  RISC-V: KVM: Recover gstage huge page mappings during disable-dirty-log

 arch/riscv/include/asm/kvm_gstage.h |  4 ++
 arch/riscv/kvm/gstage.c             | 42 +++++++++++++++++++
 arch/riscv/kvm/mmu.c                | 63 ++++++++++++++++++++++++++++-
 arch/riscv/kvm/trace.h              | 25 ++++++++++++
 arch/riscv/kvm/vcpu_exit.c          |  3 ++
 5 files changed, 136 insertions(+), 1 deletion(-)

-- 
2.47.3

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
