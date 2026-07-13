Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7051C44501
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 01:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/VwQn+1EddDS7fcE79STWritI8bFTxMeJ2e2kKkYRoA=; b=fdQKSrE6GgX0Ww
	h9a/Sx+rCjT309oGbR+lHN2TZ86jkGQa0vsbBiQrssjaVFN+9fcrNA5UsUlssUT9tzgoX+Us1n7vy
	DK1XqQu5XoRDKQ9sDPC9+GCniHJTCxbpRP/PNKfYewbhr1/M8eJjqW8h8iQhbt5eP7xWpIJo7hBS/
	735eKHk/iFkjCowxiUlpgK9eCUgXHYieO8iiyIU4NiMUr8gXxeW9z4v/b3Ci5c30p7vndlDEWKtF/
	DkzgZQhzC0/xSlalvk3x5Dx9e6lDd4tGrBa/Kp0V0dbd/K9uHFcOi2aNPr6XH4miGEJ+dUfLovIN0
	Z9f9YMQntgqfwlsitzMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj55d-00000007tl5-2dND;
	Mon, 13 Jul 2026 01:04:09 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj55Z-00000007tfd-3ru2
	for kvm-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 01:04:06 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2cab973140bso29714315ad.3
        for <kvm-riscv@lists.infradead.org>; Sun, 12 Jul 2026 18:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783904645; x=1784509445; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nI0CkxxyoH8k0I7InDiV0iYilFi9jdMMJ7m2xkEZwHw=;
        b=sTND7hhPpivrNPKLcY7E1QNl8LbT409YtQuJrH7IdLYQMALyCQ7Sn7u5AJOSvLsfUj
         9nRV6hY5s6IvGXnv8rRxWTTz4w0guu5N1nkW0WPCNnc3bNbj2PbHqCtUudmQ1pNTIjJ9
         /40vzFAFgg1Tx5wYfbKCkMjEyGj946/D7LOiwdbYGZ2X9JjvZCflxElDYEMRHpvAMQ8s
         SUqtfVzJHeI6z73pWqQmg+mQSHklPbOI9XruOQ9fJkHD0cf0KpHWDhjP3EE+ffVvpmlc
         x47PIdws4Dmv9clo54p355SDPyic7buJoyOfr+Ce0A8nJ5GEdma/7KI9VrJd7J9mYBsD
         RXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783904645; x=1784509445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nI0CkxxyoH8k0I7InDiV0iYilFi9jdMMJ7m2xkEZwHw=;
        b=Lq1UKLZrh9S56/P16fxdY9qP32tGxelE0ybHHf0iVDdvV6uRbBfIemHgUYGHx4fB7d
         pklr5YEt3qyhhouw4cTa9skIOeLqEPB5iLjQ5MXNctq9agWKEwQV2MSPB8jh+2nCyNov
         4X2sbe1k0EIZn8e84412HYvzGT7nAnuqep4K32eb92uozjCnGGZ7Ei9rVcbtiXfv0wu7
         ZxDi9+vGDqb3muIUbS4hJAG/OJoDv9zzWO9FvCCy140V4I1bz2MBh18dnjnhuIW6xDpJ
         j/Pwm6XwTX7N0dR/KY+Guuo2Nr6iszxtOARYP+jAIrnYHPHcWf0TTfNof1Z6NxAfREGz
         1BQw==
X-Forwarded-Encrypted: i=1; AHgh+RoF9KWIiSOTGKOsWi8VaSctjBW9320AJroLDQw8/6jV7mDHvLznZJe2osgptnPeUsDcZPQfxq5zaiU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwkrrtweiiFeeZTJi49qIBgz1oudLAbnArHdiEqgtkZJVa8w9Vh
	RELRawCrrI2JKzV00TD33bN3y4cZyuLaQokMAdqB1gh0J3FuAV9u/u2L
X-Gm-Gg: AfdE7cnlDGeAv/zx+wqbMg9pOn/u0+S6yjkcrEK5rQy8swv9vbKmULXPB1DbmDFvcQ2
	XhQd1xYut7ivWZUhA1txDX35FylrtcKiYAMgCjkl5IT9QCF7WIBrsjQBYiNzoZBbJzA1/Rh5dx/
	EImSPc8qM/OdHdgnPzJgnI+rvu7WK4VGvh47tlL8IcsHdFbGiXHN8xIrFyezSaDmmNUcy3+wySC
	JgGlG/vfW1DjlHDIUllw85G9ke2NFPI5fivC2hEjDOpoR7G1JYpsW7jmqO6kslSxB5/3oxDYws2
	whoqjKXOOiblFFQYlPbKZgTw3yzkmMvUf81b+t8o+guoZ8MZS2IscfBV9Ru92/I89tbJkP4qSSt
	ESePa/lBB/sfzbHdfSnyNM5EGt4R+fIClRW4pBw2M4Vy85UN3Rc12sgqBPnbS11IAR8KXinE+K7
	MXtJjJo13GdT4=
X-Received: by 2002:a17:902:f708:b0:2cc:98b4:e7d7 with SMTP id d9443c01a7336-2ce9f17913emr69731695ad.45.1783904645152;
        Sun, 12 Jul 2026 18:04:05 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e1aesm91755405ad.39.2026.07.12.18.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 18:04:04 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Andy Chiu <andybnac@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v6 6/8] RISC-V: KVM: Delegate SPELP bit to VS/VU mode if landing pad is enabled.
Date: Mon, 13 Jul 2026 09:02:59 +0800
Message-ID: <20260713010302.303278-7-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713010302.303278-1-inochiama@gmail.com>
References: <20260713010302.303278-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_180405_955938_8C2FD535 
X-CRM114-Status: UNSURE (   9.04  )
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

Delegate the newly added SPELP bit from Zicfilp extension to VS/VU mode
if it enables landing pad support.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/kvm/vcpu_exit.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 12eebeabdf14..92a3ea7c7ffb 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -154,6 +154,13 @@ void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
 	/* Clear Guest SSTATUS.SIE bit */
 	vsstatus &= ~SR_SIE;
 
+	/* Change Guest SSTATUS.SPELP bit */
+	if (vcpu->arch.cfg.henvcfg & ENVCFG_LPE) {
+		vsstatus &= ~SR_SPELP;
+		vsstatus |= vcpu->arch.guest_context.sstatus & SR_SPELP;
+		vcpu->arch.guest_context.sstatus &= ~SR_SPELP;
+	}
+
 	/* Update Guest SSTATUS */
 	ncsr_write(CSR_VSSTATUS, vsstatus);
 
-- 
2.55.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
