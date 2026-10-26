Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C3E606A326
	for <kvm-riscv@archiver.kernel.org>; Mon, 26 Oct 2026 03:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W9AeFHGK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RsMzAqiv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GPmdrEh5jV1DaLriQn7iz2jk2DW9bhue3o0uugViEmo=; b=W9AeFHGKEajZFQt2pTlxX7NMy8
	FrdcoWtleGs3YlBkTI/uwNCA8jg3BQ4ZPHrx3C1t5gQpoGBNxQKQRhFlnmsN3p19do3OAmoprQbsh
	gb+TBu/fcVNLdIHtJkQCA/sZOGmiWCYqw1sIQVVWl9zPgoA9MBipyJSXpCeKoWV6ZzDo2qAgGA5Kr
	ClS7ex7euXbYcaqqh+9j+XgMWo0pHUnNCTYsFnM6qRQI585Z0NPnWy20gnp7etIen7Ohyhm3GvfCt
	WCjpZzJx4xY82TZYmshDP6gtEeU07XqLp1cG8uV7ZLX9cIXxw6BL6cvNkg8KTUatdS5OK9UbeVK13
	uSYQ9RlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLBdV-00000001fqd-0s46;
	Mon, 26 Oct 2026 03:44:37 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLBdS-00000001foC-1VuE
	for kvm-riscv@lists.infradead.org;
	Mon, 26 Oct 2026 03:44:35 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-5365d26ccbdso30389671cf.0
        for <kvm-riscv@lists.infradead.org>; Sun, 25 Oct 2026 20:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792986273; x=1793591073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ODlqko/BPpmyU4h+oI7UAqT8yjWxPc3m1CLwqWBtjDo=;
        b=RsMzAqivZfsrG4c3+88oRXGqAndT/MvdVmzkMMhVCtGVeehhlgELqvq9qd3tHQuq1P
         /pfZ7j4BaTKqSoSL4rYTh9M30pTkPqd8RQy8WLLAdLfFlA718ReD5H8X1UbtphTiSUpj
         Hnybczb55VatAk8/bkEv9Xkrdu5gTBzR8r4Jb9FO1kPUco03nVDOj/5max/U1S8y/5h7
         JmDbXg2vRonz4anJmtRDymDvibKXmfk2FvSGI/IrOR6i1LEYT+9VMHDgpuUigGf4akkX
         uoZyqgVF0MDCwSHWS7vO8L5dy0EE3kCaTy6emzizUe+rRPb5ElAHSHlpMj3VP18Dm79T
         XwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792986273; x=1793591073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ODlqko/BPpmyU4h+oI7UAqT8yjWxPc3m1CLwqWBtjDo=;
        b=JKaXfiNZspa0H80xIft7jxBaTSO+aJUPUmQWNbBvsgRQsa/uWClT94APiqmI1bRM/q
         b8x6xEY3WvnACgNQbP+brn159Rp3pm9A0sl6B93OzgQpHG7gDsNgLKUqbADcCZFRS6VB
         jj97pA6nVfOIUBmHOXoqFanQg1qDaIJI8L2XIludrClhGO/AKzo9o/BbK75DYVlIupq/
         K7Y9ba/ICFBeEAGGQTEFfKSa0tu4EJfDy/v2oNjs3W2gb86cGG7FzkQHaB5NCbl/56fV
         j5o/tDMBsMIVrzr11XKsGaqlxrw0ko2jqgnZ774nLQ9H3RSICrsQeBdQQDQzaZLrIkic
         Oz9g==
X-Forwarded-Encrypted: i=1; AKwUvBx/Y/y34igtEODwIFJKkYTfjQ7X8+BzjALAbKQlK9ionV3VEWUQvgA36y9kesSToRQtCd2SxhuEif0=@lists.infradead.org
X-Gm-Message-State: AFq9FYJOgkDgwSreApG/2GbxFDPwW8GJpvfevX7V7QWNO3hh0jPDqefY
	y9JCgqf9khGb7HbRPGtNJaJ5OuG/niIX3hKMA6KLuNc5vnEDcGCY05cz
X-Gm-Gg: AYBFou26mkPm0TaOaLCY9kS8a1Bov+bVuAMlM7pXEV2Iz/86keR2fK+965hLo1vu6Oi
	9+hzS4XMWRz4qFwUW6JpVldVyXp41v+NeuNTVAce33ljkTzyGYVPhUn9IABorae34a4deDykecF
	TWjmDJ1dEzqK5LMFfo8trURNN3vlzkcWcpMGzOtmA33WmKo4ZYCcWEHaV6UcbwkcRL7lLatSpmx
	xdtJF0/zCsaEdkVi09idCLZqNYDws2XQYaDZNyWWMFVhk7qk7XYU3ydcDuAxTm09/w9Gnx/bqam
	lTDtQhajG+vH6OhJx4sUfHFlKg6JFaX/aFVtOryS0S1OYRPn2YYCZuGbxHQvQdDJO+l9NudO9iv
	1fOQpGK3yKG+NvB0PF6uJ6TO/FeZ0dQazEuu9Dj9ER/p5qpuNkXycXvfET/Y3xbqfJPbOnpUAk3
	LXN2oKRLuo7+/QjbE3DKKWDVhJmgvVrIM2s8qDTn7CglIrcwr93RBzjgZdZyYYPPrDLE6Ar2c2y
	AfS9nQoUKbMXGxk3RfvicV9VjyjdAb+p0vdLnpz4KvQc2mLJhao3NN4fi8aJNKK41CHEGbsr0t7
	xc30qXr1GNPHtb+tEHBoTB9sWzh52bstmxqXPWHHFBO6tr/hgyl7flf4QMd7
X-Received: by 2002:ac8:5a0f:0:b0:530:1b1:72be with SMTP id d75a77b69052e-5383b6838c2mr89604751cf.40.1792986273086;
        Sun, 25 Oct 2026 20:44:33 -0700 (PDT)
Received: from paul-white-HP-Pavilion-Laptop-15-cs1xxx.mynetworksettings.com ([2600:4040:ad65:1c00:4cc4:d0be:4ab6:9a0b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394c5273sm46202121cf.9.2026.10.25.20.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:44:32 -0700 (PDT)
From: Paul White <paul.white.kernel@gmail.com>
To: anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul White <paul.white.kernel@gmail.com>
Subject: [PATCH 2/2] KVM: riscv: Eliminate redundancy in set_reg function via pointers
Date: Sun, 25 Oct 2026 23:41:27 -0400
Message-ID: <073a56efd7e8f5b1e54207f266e1fa972b54a0e2.1792982932.git.paul.white.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1792982932.git.paul.white.kernel@gmail.com>
References: <cover.1792982932.git.paul.white.kernel@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_204434_413712_735EAC2D 
X-CRM114-Status: GOOD (  22.89  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The original code is essentially asking: for each possible floating
point mode, ask if reg_num is a status control register or a data
register. It is redundant to ask those same questions for every
possible floating point mode case.

In order to only ask the "status control register or data register"
question once, the variables in the status control if statement and
the data register if statement that would be different depending on
the type of floating point mode (for example,
KVM_REG_RISCV_FP_F_REG(fcsr) would be KVM_REG_RISCV_FP_D_REG(fcsr) if
the floating point mode was double) were made local variables of the
entire function so that once the cpu passes the if statement inquiring
whether it is double point mode or single point mode, all the
variables that change depending on the type in the status control if
statements and data register if statements will be set to the
appropriate values they should be when in that mode before/when it
enters the status control and data register if statements, allowing me
to only have to ask those questions once and creating a dynamic code
that changes based on the information. This results in a "asking the
type then asking status control or data register question once"
structure rather than a type-questions, type-questions redundant
structure like before.

This results in faster cpu execution because despite the longer lines
of code the cpu has to make less decisions, which saves time in case,
due to its tendency to make assumptions about what an if statement will
evaluate to, it has to backpedal because it realized it needed to go
down a different if statement/path. Finding an address via my
bare-metal approach is also faster than looking up an object properties
and then an array. It is also more maintainable in the future. If the
original code needed to be changed, you would have to remember to do
the same thing to both type blocks whereas mine would just require a
change in the beginning if statements. If a new floating point mode was
added you have to ask those same questions all over again, which may
make the code longer in the long run.

I also renamed reg_num to token_reg_num in my code as I felt it made
it clearer that it was the register number the application wants and
requested in a token so that it can write data into that register. It
differentiated it from the many other variables with the word reg in
it.

Signed-off-by: Paul White <paul.white.kernel@gmail.com>
---
 arch/riscv/kvm/vcpu_fp.c | 64 ++++++++++++++++++++++++----------------
 1 file changed, 38 insertions(+), 26 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_fp.c b/arch/riscv/kvm/vcpu_fp.c
index 16999a5c45de..fe4957603519 100644
--- a/arch/riscv/kvm/vcpu_fp.c
+++ b/arch/riscv/kvm/vcpu_fp.c
@@ -144,41 +144,53 @@ int kvm_riscv_vcpu_set_reg_fp(struct kvm_vcpu *vcpu,
 	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
 	unsigned long __user *uaddr =
 			(unsigned long __user *)(unsigned long)reg->addr;
-	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+	unsigned long token_reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
 					    KVM_REG_SIZE_MASK |
 					    rtype);
 	void *reg_val;
 
+	u32 *fcsr_addr;
+	void *f_array_addr;
+	size_t byte_offset = 0;
+	unsigned long offical_fcsr_num = 0;
+	unsigned long offical_first_reg = 0;
+	unsigned long offical_last_reg = 0;
+
 	if ((rtype == KVM_REG_RISCV_FP_F) &&
 	    riscv_isa_extension_available(vcpu->arch.isa, F)) {
+		fcsr_addr = &cntx->fp.f.fcsr;
+		f_array_addr = &cntx->fp.f.f;
+		byte_offset = 4;
+		offical_fcsr_num = KVM_REG_RISCV_FP_F_REG(fcsr);
+		offical_first_reg = KVM_REG_RISCV_FP_F_REG(f[0]);
+		offical_last_reg = KVM_REG_RISCV_FP_F_REG(f[31]);
+	} else if  ((rtype == KVM_REG_RISCV_FP_D) &&
+			   riscv_isa_extension_available(vcpu->arch.isa, D)) {
+		fcsr_addr = &cntx->fp.d.fcsr;
+		f_array_addr = &cntx->fp.d.f;
+		byte_offset = 8;
+		offical_fcsr_num = KVM_REG_RISCV_FP_D_REG(fcsr);
+		offical_first_reg = KVM_REG_RISCV_FP_D_REG(f[0]);
+		offical_last_reg = KVM_REG_RISCV_FP_D_REG(f[31]);
+	} else {
+		return -ENOENT;
+	}
+
+	if (token_reg_num == offical_fcsr_num) {
 		if (KVM_REG_SIZE(reg->id) != sizeof(u32))
 			return -EINVAL;
-		if (reg_num == KVM_REG_RISCV_FP_F_REG(fcsr))
-			reg_val = &cntx->fp.f.fcsr;
-		else if ((KVM_REG_RISCV_FP_F_REG(f[0]) <= reg_num) &&
-			 reg_num <= KVM_REG_RISCV_FP_F_REG(f[31])) {
-			reg_num = array_index_nospec(reg_num,
-						     ARRAY_SIZE(cntx->fp.f.f));
-			reg_val = &cntx->fp.f.f[reg_num];
-		} else
-			return -ENOENT;
-	} else if ((rtype == KVM_REG_RISCV_FP_D) &&
-		   riscv_isa_extension_available(vcpu->arch.isa, D)) {
-		if (reg_num == KVM_REG_RISCV_FP_D_REG(fcsr)) {
-			if (KVM_REG_SIZE(reg->id) != sizeof(u32))
-				return -EINVAL;
-			reg_val = &cntx->fp.d.fcsr;
-		} else if ((KVM_REG_RISCV_FP_D_REG(f[0]) <= reg_num) &&
-			   reg_num <= KVM_REG_RISCV_FP_D_REG(f[31])) {
-			if (KVM_REG_SIZE(reg->id) != sizeof(u64))
-				return -EINVAL;
-			reg_num = array_index_nospec(reg_num,
-						     ARRAY_SIZE(cntx->fp.d.f));
-			reg_val = &cntx->fp.d.f[reg_num];
-		} else
-			return -ENOENT;
-	} else
+		reg_val = fcsr_addr;
+	} else if ((offical_first_reg <= token_reg_num) && (token_reg_num <= offical_last_reg)) {
+		if ((KVM_REG_SIZE(reg->id) != sizeof(u32)) &&
+		    (KVM_REG_SIZE(reg->id) != sizeof(u64))) {
+			return -EINVAL;
+		}
+		token_reg_num = array_index_nospec(token_reg_num,
+						   32);
+		reg_val = (u8 *)f_array_addr + (token_reg_num * byte_offset);
+	} else {
 		return -ENOENT;
+	}
 
 	if (copy_from_user(reg_val, uaddr, KVM_REG_SIZE(reg->id)))
 		return -EFAULT;
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
