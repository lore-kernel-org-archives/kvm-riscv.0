Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B110E606A7DC
	for <kvm-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 11:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eC78lmx0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=MDXYK+H2kSJ9fkqpyKu+JeKvOw7yqr5eXMwtcM6Ob9o=; b=eC78lmx0+J+9Cs27cTdqvpovKf
	yj7j41333VfbhsW7Drq1Nyy8QBGLVKUH9cbaDGWN9/CouF3S1WZahuduquKoKJai6YA/c+CxRaXFb
	gcyK+fQ4t2jStfsE21H1p6gIGOwkvS0wstawNhxA1OufZCqLz8xiNUmvW+wBOeGh2wo+uUfUFxpWD
	/b64syAlfXAIg/LRc8L5UHQG56Ctw7niQjMJnWPdJuK2JK+JA8o25L2JSWWVlsLGVJIA0FT0E7Q2h
	abmF9eAu+DWKz84iISUKWo8Wzfs3KWsLjJwOIGYx4ifpVISd/zR0oraXOVqLpvXLsgwmS5IlhI1mP
	rHrEFO4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfdU-00000004W21-1bas;
	Tue, 27 Oct 2026 11:46:36 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfdR-00000004VzU-1e8Z;
	Tue, 27 Oct 2026 11:46:35 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jDTGb3ttYz59trH;
	Tue, 27 Oct 2026 19:46:15 +0800 (CST)
Received: from szxl2zmapp05.zte.com.cn ([10.1.32.37])
	by mse-fl2.zte.com.cn with SMTP id 69RBkBYp038591;
	Tue, 27 Oct 2026 19:46:11 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from localhost.localdomain (unknown [10.234.74.162])
	by smtp (Zmail) with SMTP;
	Tue, 27 Oct 2026 19:46:14 +0800
X-Zmail-TransId: 3e816ae08f05027-7111e
X-Zmail-LocalSMTP: 1
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-Zmail-RealSender: wang.yechao255@zte.com.cn
From: Wang Yechao <wang.yechao255@zte.com.cn>
To: Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>,
        Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Wang Yechao <wang.yechao255@zte.com.cn>
Subject: [PATCH] RISC-V: KVM: Fix out-of-bounds index into aia_irq2bitpos[]
Date: Tue, 27 Oct 2026 19:44:36 +0800
Message-ID: <20261027114439.699273-1-wang.yechao255@zte.com.cn>
X-Mailer: git-send-email 2.41.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MAIL: mse-fl2.zte.com.cn 69RBkBYp038591
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Tue, 27 Oct 2026 19:46:15 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AE08F07.000/4jDTGb3ttYz59trH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_044633_599111_D439D676 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.2 (----)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

aia_get_iprio8() and aia_set_iprio8() index the 64-entry
aia_irq2bitpos[] array with an irq value derived from the
guest-controlled VSISELECT register. For RV64:

  first_irq = (isel - ISELECT_IPRIO0) * 4
  nirqs = 8
  isel up to ISELECT_IPRIO15

so the irq number can reach 67 and aia_irq2bitpos[64..67] is
accessed out of bounds. A malicious guest can trigger this,
causing host panic under KASAN/UBSAN or undefined behavior
otherwise.

Add an explicit bounds check in both accessors before indexing
the table.

Fixes: 2f4d58f7635a ("RISC-V: KVM: Virtualize per-HART AIA CSRs")
Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
---
 arch/riscv/kvm/aia.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index b3b466e4db33..a51d2db7f331 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -286,8 +286,12 @@ static int aia_irq2bitpos[] = {
 static u8 aia_get_iprio8(struct kvm_vcpu *vcpu, unsigned int irq)
 {
 	unsigned long hviprio;
-	int bitpos = aia_irq2bitpos[irq];
+	int bitpos;
 
+	if (irq >= ARRAY_SIZE(aia_irq2bitpos))
+		return 0;
+
+	bitpos = aia_irq2bitpos[irq];
 	if (bitpos < 0)
 		return 0;
 
@@ -319,8 +323,12 @@ static u8 aia_get_iprio8(struct kvm_vcpu *vcpu, unsigned int irq)
 static void aia_set_iprio8(struct kvm_vcpu *vcpu, unsigned int irq, u8 prio)
 {
 	unsigned long hviprio;
-	int bitpos = aia_irq2bitpos[irq];
+	int bitpos;
+
+	if (irq >= ARRAY_SIZE(aia_irq2bitpos))
+		return;
 
+	bitpos = aia_irq2bitpos[irq];
 	if (bitpos < 0)
 		return;
 
-- 
2.27.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
