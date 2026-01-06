Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8945CE9D79
	for <kvm-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 16:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UDvbkvtNShkOYDFVjb+rjNY8cQCEXNxDVpYF0U0IZS0=; b=YKj/lFuDavfNq8
	eYPKr6p7dH9F98+OPe9/4mjC+GbLURtt5c2As/zEJZbDFB3KwMunD5S+EM40rq/qkzYYjrzz8Nbj6
	SBlm8cLdNUTttSXIXNu4YePxsimOggh45KnSOjIKwZ2My46av3Z11+LPl3t0R2bLpQwWbx2Jkph2A
	UU+8f0okn8Jd/+mRqnekt6Ntq5T4Qu9q/q5S0HzmjPrcUtK/gojn7XD1obycsnTzqy7qVoz2Tf0I1
	k7KOmMeflG8tp25cnabzIHsiSXnBGsn492IZqoHyUIMK+at/09X+jmRJrkkPv5T+/2qMbatbd3wB1
	81FNEv9V2N+yZG7Umi2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9vb-0000000DUhf-0jiU;
	Tue, 06 Jan 2026 16:29:03 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9vY-0000000DUdI-0RYS;
	Tue, 06 Jan 2026 16:29:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=bHuQwcVIp2YluoKe19/5U8yVgDYCi8fRyTDunT6mMgY=; b=EsE7d8+u2g5jLh
	QeXVu02ODZlF7sT12J7GdLWPxDn1EMzCAUnNr20O9sawsua4vVzYca0iGBnOwzj9bDMAt6mKFtXbX
	OMRNL4a7dIjLP/Qib4xy66oZ+G4BOnl8JeLq2+zjKD0IXMVhu9AX4wcMi/LlLP3kSOq7P+C4j6frD
	6JaKkyXEj8vl37YLiAY+o4/JEHbeQLO5u5wDY/RZ5QJ1pRQguWMGdc23jB10hnBl/MkSFjpYz8aE/
	gdN+J7FLtmB65cCLp+u40ZC6T1R+1NmFlL01SQRxJ2RHYcb6C7y6nCjMulBVpFDkqExBpl4n5EE2C
	5jkhcv0kzHvUoJDPbcaQ==;
Received: from [63.135.74.212] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1vd9vP-008Lo9-5M; Tue, 06 Jan 2026 16:28:51 +0000
Received: from ben by rainbowdash with local (Exim 4.99.1)
	(envelope-from <ben@rainbowdash>)
	id 1vd9vO-000000005x1-1lgE;
	Tue, 06 Jan 2026 16:28:50 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: kvm@vger.kernel.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	anup@brainfault.org,
	atish.patra@linux.dev,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] RISC-V: KVM: fix __le64 type assignments
Date: Tue,  6 Jan 2026 16:28:48 +0000
Message-Id: <20260106162848.22866-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_082900_223202_EF401D59 
X-CRM114-Status: UNSURE (   9.43  )
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

The two swaps from le32/le64 in arch/riscv/include/asm/kvm_nacl.h
are generating a number of type assingment warnings in sparse, so
fix by using __force and assuming the code is correct.

Fixes a number of:

arch/riscv/kvm/vcpu.c:371:21: warning: cast to restricted __le64
arch/riscv/kvm/vcpu.c:374:16: warning: cast to restricted __le64
arch/riscv/kvm/vcpu.c:586:17: warning: incorrect type in assignment (different base types)
arch/riscv/kvm/vcpu.c:586:17:    expected unsigned long
arch/riscv/kvm/vcpu.c:586:17:    got restricted __le64 [usertype]

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/include/asm/kvm_nacl.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_nacl.h b/arch/riscv/include/asm/kvm_nacl.h
index 4124d5e06a0f..2483738029cb 100644
--- a/arch/riscv/include/asm/kvm_nacl.h
+++ b/arch/riscv/include/asm/kvm_nacl.h
@@ -58,11 +58,11 @@ void kvm_riscv_nacl_exit(void);
 int kvm_riscv_nacl_init(void);
 
 #ifdef CONFIG_32BIT
-#define lelong_to_cpu(__x)	le32_to_cpu(__x)
-#define cpu_to_lelong(__x)	cpu_to_le32(__x)
+#define lelong_to_cpu(__x)	le32_to_cpu((__force __le32)__x)
+#define cpu_to_lelong(__x)	(__force unsigned long)cpu_to_le32(__x)
 #else
-#define lelong_to_cpu(__x)	le64_to_cpu(__x)
-#define cpu_to_lelong(__x)	cpu_to_le64(__x)
+#define lelong_to_cpu(__x)	le64_to_cpu((__force __le64)__x)
+#define cpu_to_lelong(__x)	(__force unsigned long)cpu_to_le64(__x)
 #endif
 
 #define nacl_shmem()							\
-- 
2.37.2.352.g3c44437643


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
