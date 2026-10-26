Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE95606A31D
	for <kvm-riscv@archiver.kernel.org>; Mon, 26 Oct 2026 03:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gZWsvYGy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pquVHigd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NzJKlpkO86k6PWbob6I9bxySZsXFJyC9WgSSVTwqfXA=; b=gZWsvYGyAZF7pLq6qwE0sdusFm
	FcV53NWBgWrHIlb8MHrX4/GaQkYOsFcA1tsgWZau0hJjMMeiLHthkYmo5fxj5tooBF47cGpZZvaj4
	vs60gZqGhVZGzXvUg3pRPi35r41MJbEz0pQqyadS1Dd/1hELs5ZaqNU2zaPQ+w20OPmSVkvxRkDDm
	rJpd0oo0qI7DVvqsVh1KsJTIalkK6YrR3h/BCNDjjTzHuJyGN1VD+fusAkBH2aOAq6RNl/WypI3ej
	jE21kfQooVDpEnk9HZZ6Lavh8DO3eufXfGKQ207+0zVQx9zB8SdfVJkfy/sxjITp/xSMwTcGE89Y2
	rzaQp/lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLBdV-00000001fqW-0g5q;
	Mon, 26 Oct 2026 03:44:37 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLBdR-00000001foA-2ObU
	for kvm-riscv@lists.infradead.org;
	Mon, 26 Oct 2026 03:44:35 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-5363316fa0cso40867211cf.3
        for <kvm-riscv@lists.infradead.org>; Sun, 25 Oct 2026 20:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792986272; x=1793591072; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epO44nguKeOQQCjQUMlL4Yq07v1OlIx6nj2eYc7j0sg=;
        b=pquVHigdiic9Q/11PW43ItTNStT7HhsEeVOMpngQyqWF8E7u/9CExMEweA9Q2stYqE
         Ty/osZq1s26ZgBq4IlsC9XAF93KMx1LCrI4Uc6hfxqlvTnNRmRW0V6sKGxMu3IOS8roZ
         qBg508rhWyh1zsHedr3Dak24Q5QWciZMVQq4pOsxV4pXtbWsIMeFYvLSi1F12YoJRUI8
         iuGIs+ljghXYECQY7lG2xqCgYqOCk6ZybKWiPP+Vp9nxxiczdMlBD2FLvCGP2XwxrJoq
         3JUgaqE2kcYHWxTjpgEx7tz4vE4aspw7mwnmR3cPPEF5PI5EigpwLCYmpZRl+1dTKJm9
         ajnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792986272; x=1793591072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=epO44nguKeOQQCjQUMlL4Yq07v1OlIx6nj2eYc7j0sg=;
        b=Ey+L2Q18fYZgmY3xyHsMY0vKIolkI16KLGYSuwQGQIdnraYavG1C6pniLNa0D3kB9K
         bUDFH4+pbK/4f8/dWnHmFqSjcZLlm8Qh82r3xn7yP5oBbFoH2dS7WbZKOckZp6QT651u
         26xQnQqn5i/wgkkfJweFTCk4+oD5eYmTv6TrcZESCk4moI9vTBQVYF3Ghuv2a0PZgrQi
         obTCoukyXiQRmLVEvE4ef4M5Fxc5cDiwcP6LL6lBP4MRGv657wYrDvZ4irkpDdxyEBmw
         M72nS/t7LSpe60T3y7Em0WlwVAwGW9NWdvYfD3Fdq+NcJxGOFLRbTQhYrhY8PsXsV8sk
         WaTw==
X-Forwarded-Encrypted: i=1; AKwUvByoZ3auVLaoINJSVK/Aoq1/UETPhI5ds9AbttBDMDXAkhnFOs2A0FkK7VVNgJYpeQiYsz/ClaBmIQo=@lists.infradead.org
X-Gm-Message-State: AFq9FYI9FyjjBOfRvRfD/F3z1h3KQYNu65xCJ67/TMAg03PU1n6osHDn
	oztBJepsvH8vQpLEgwfrj5cD+yO4pG86Xu7Dub7nHuLIM2nLGIICALzP
X-Gm-Gg: AYBFou2v5oE6maLUq+hQkFAn3wRDCcHL8paZrPqeP0YxfwTD8CAS90FMxIk4AgswgAA
	NDwB9omSOKqQ0jWRQSlzR1sHmDz8O9qw/ziDLkhptTCkBzjhNIe2Fj2dy3ecqEW5RGmTb3FdCc/
	CwEBZq4ArawpfhNz6hs0nYaKH9OudyRQKFEEhDzyCz4GqrNftw9WJ0+ETOClopiZT93qcfJGnhL
	g5FS5Gdu6vWRzDbrGOUhT3OOWMyMA/+RBne+eR0Azy1Ng4ON23HynwP08C6zHX6q/WtlTww5TDI
	A5IitIyBxVaKF2hnuHYy1BRmrXSpILb7B3kNqsFmhTUjagpNGshbqiRECSDOtKnnMHtoSWFowP/
	e5cSaYTCZkFcDT4BCQfWL1YKg45RgM9HF3HtDhv0Zs5VfYjOFGK5rwkGbTpzvky3gViUCn7LLRH
	QRjLNs6YTXqXLGZJmzm7vB+0yZb2H1IiESJK/2T2w+xUXvtdpNVE5eFbg/TDBSymjvfIogqChpj
	gY0G3OZ13R/n46pjVVayRcCGI+wulrLEM1IHorYlLquFqN8w/6ZE4qR9QRGHFnAQ4DFWHnNFOEH
	4ofvqIaA3Ytlfa9Yletj4UWPV0O6tS5i/pYE1sq1wj+kK4enQ5j24dJkoZBK8GScYvB6v9chdjS
	wBq6exg==
X-Received: by 2002:a05:622a:64f:b0:535:13c1:ce94 with SMTP id d75a77b69052e-5383b5d830emr85091791cf.38.1792986272132;
        Sun, 25 Oct 2026 20:44:32 -0700 (PDT)
Received: from paul-white-HP-Pavilion-Laptop-15-cs1xxx.mynetworksettings.com ([2600:4040:ad65:1c00:4cc4:d0be:4ab6:9a0b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394c5273sm46202121cf.9.2026.10.25.20.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:44:31 -0700 (PDT)
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
Subject: [PATCH 1/2] KVM: riscv: Eliminate redundancy in get_reg function via pointers
Date: Sun, 25 Oct 2026 23:41:26 -0400
Message-ID: <f7fcf15c1117ce734247cf951c0afff1f5eb54c8.1792982932.git.paul.white.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1792982932.git.paul.white.kernel@gmail.com>
References: <cover.1792982932.git.paul.white.kernel@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_204433_648603_858E2B38 
X-CRM114-Status: GOOD (  23.02  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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
requested in a token. It differentiated it from the many other
variables with the word reg in it.

Signed-off-by: Paul White <paul.white.kernel@gmail.com>
---
 arch/riscv/kvm/vcpu_fp.c | 70 +++++++++++++++++++++++-----------------
 1 file changed, 41 insertions(+), 29 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_fp.c b/arch/riscv/kvm/vcpu_fp.c
index bb11e6757d34..16999a5c45de 100644
--- a/arch/riscv/kvm/vcpu_fp.c
+++ b/arch/riscv/kvm/vcpu_fp.c
@@ -83,41 +83,53 @@ int kvm_riscv_vcpu_get_reg_fp(struct kvm_vcpu *vcpu,
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
-			  reg_num <= KVM_REG_RISCV_FP_F_REG(f[31])) {
-			reg_num = array_index_nospec(reg_num,
-					ARRAY_SIZE(cntx->fp.f.f));
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
-					ARRAY_SIZE(cntx->fp.d.f));
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
 
 	if (copy_to_user(uaddr, reg_val, KVM_REG_SIZE(reg->id)))
 		return -EFAULT;
@@ -144,9 +156,9 @@ int kvm_riscv_vcpu_set_reg_fp(struct kvm_vcpu *vcpu,
 		if (reg_num == KVM_REG_RISCV_FP_F_REG(fcsr))
 			reg_val = &cntx->fp.f.fcsr;
 		else if ((KVM_REG_RISCV_FP_F_REG(f[0]) <= reg_num) &&
-			  reg_num <= KVM_REG_RISCV_FP_F_REG(f[31])) {
+			 reg_num <= KVM_REG_RISCV_FP_F_REG(f[31])) {
 			reg_num = array_index_nospec(reg_num,
-					ARRAY_SIZE(cntx->fp.f.f));
+						     ARRAY_SIZE(cntx->fp.f.f));
 			reg_val = &cntx->fp.f.f[reg_num];
 		} else
 			return -ENOENT;
@@ -161,7 +173,7 @@ int kvm_riscv_vcpu_set_reg_fp(struct kvm_vcpu *vcpu,
 			if (KVM_REG_SIZE(reg->id) != sizeof(u64))
 				return -EINVAL;
 			reg_num = array_index_nospec(reg_num,
-					ARRAY_SIZE(cntx->fp.d.f));
+						     ARRAY_SIZE(cntx->fp.d.f));
 			reg_val = &cntx->fp.d.f[reg_num];
 		} else
 			return -ENOENT;
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
