Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F102CCD8C8C
	for <kvm-riscv@archiver.kernel.org>; Sun,  7 Jun 2026 08:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eChJMjU6epVReuQXxsA1yMNs8jqD5KBgCdTgKG6rqoE=; b=WP+clsm65z2nW2
	UdMofr4HqNn1D/RXI3FXcaJrHiHgqjy1px5zhn3F2GHJRkL56eEjfi3LyefrUn9spJs01tyb/dWvx
	L92BBRowohCUGnVkVspQOLK7dDzGgxIn6e2bjAJUIJBCwMKU83Oo9mxwMKfB8ukBP8rW2G82B0Aqc
	ToJ27id3sCI0jflL2g5bcUc9Trr903dE6XwYxHakqd48hP4Ph2h+3hPVJ3fcQsiEUlzeYztRA41fu
	4QK6HGBa9HPKfzTnnVzERL4KplmbeybLCrBmCAuCq2JBFCWrvyrIv5sRWOu7Gw/P+8akGA2Uy4yrN
	L+QtGP/i7jSpsk2ThpGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW8bX-000000027Rf-2wSe;
	Sun, 07 Jun 2026 08:11:35 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW8bU-000000027Mo-26se
	for kvm-riscv@lists.infradead.org;
	Sun, 07 Jun 2026 08:11:33 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c85a2c012e5so1123045a12.1
        for <kvm-riscv@lists.infradead.org>; Sun, 07 Jun 2026 01:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780819891; x=1781424691; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96KDBvYNlF0dtZ4IL21QKYqtr/QK61EGNPVGSZe4zmA=;
        b=klYFhHgAhity1R3Hv8Eisr8BzN6tJRC9lw4OzccREDKQOer5YI0lEduzl/q0uYjvjg
         HhRMki3eW+UnJvutTv8WLuRskZyZewjLSCA2zPrzIKBJfkwyLU2roxE2oBCJ17zPaI92
         4MoBF3VIs5pPfBO2yy/WsbE/fTHQQGZpfWNnIl9hXWQfesiF87eR0LCyK9ZSase5lopX
         1q/Np5SKk1sX56gf/MpEgQ665r7djs4wOExgLrgguMb7s0JbVVvh+elKKoRQ0+gXdAii
         RJnNvOWJC3qUVYyORt+HnFpqqY0AeesDenCyM9eC23l93mjAzlY0DidrAw3kKCUKUZdH
         Bi3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780819891; x=1781424691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=96KDBvYNlF0dtZ4IL21QKYqtr/QK61EGNPVGSZe4zmA=;
        b=i5sUFv20PeY1T1dgwAH3ynTTN4csghABYbXMgHA0r+ffl+smYNe3VsMwB4qmRPGhsL
         I2UR5aEGRzn8g/RbwJQXq4HhE9t0bwShdEGHT05GJxS6EyQMfwHqJ7ZQGnyb6ePwbFHT
         1OXrpfWQKZy9gjeq+Lm8GbhV3cemYBDHvjs9V4CIFJK45d0QNhbHcfCwFIiiFKdpRybk
         2eRAvQqy8B8lu1Bp+htE/fcB6AP9iJtCbSybBkoni/pJ3+yiTKCe5wXaeUWOYTQhZlIW
         Lh0L3t0YY1tUnW95SJIdZM6jVJVP9m/va476H/fOLzQOc00yrf65bf4whIkBxSByukhc
         4ZUw==
X-Forwarded-Encrypted: i=1; AFNElJ/oDQOZHt6Tgf5uJYcMFT4/bW/8HEsYoXYOD/NHq582Za2/r2j5Y+kAUx4MgwWxyfCZfdbl8FuvtYw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwuhWx2xQGQzpgPRCaxM6mmIwGhoYuvJ4E3FyXckbTwr6seqoAa
	7epG381qMOBylS9PUWwfBkvyY6R0TjEsMAJHF41S6tTTwuWaAK486tCu
X-Gm-Gg: Acq92OGRNxXkqIMBf6vV+L/Sj3ReOFmbha8NbybDnbOlofg2i2qH0uRqeBqWXGvo+Q7
	+y8LhM4VTrt5TBfkp6nRs0mxeOn3W5d5XALXrcGwdxM7FliM6fqT7h+XcLLTXC8h6zywWthmDVk
	ybmesnd4PBfEuXsLcqekG2z0oD9WPhtX1jB2E4F4Q0qe4lRF1CdjSV1Y94/WAK1eCxoT/k2c6H0
	H5opV8b1Wn4pWlf0fYgBBUIX+XtxZLrij0jmMR+/tTU30t3pFD1dkWjAlU+kcJlHObHouelY1tM
	k6beHbcFD1eo+vm3F4Ajgq1KKTKmaFeepqJKMMXnRrDp2CGkC6UHrriuxDwwjdX0VuwylPtHtgU
	9EmPCiR0z5r91MaNifxL38ZnarckySCF2Giob36QSkRositg12+BW+VWIg1kvaGLFzx+cb8Q4zt
	kQbDopJvDujjyloFQMOe538VaDFFkr20//ww==
X-Received: by 2002:a05:6300:6705:b0:3b3:1a00:1f4a with SMTP id adf61e73a8af0-3b4cd091c0amr13541485637.43.1780819891551;
        Sun, 07 Jun 2026 01:11:31 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04311bsm11930677a12.9.2026.06.07.01.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 01:11:31 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 6/8] RISC-V: KVM: Delegate SPELP bit to VS/VU mode if landing pad is enabled.
Date: Sun,  7 Jun 2026 16:11:02 +0800
Message-ID: <20260607081105.993908-7-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607081105.993908-1-inochiama@gmail.com>
References: <20260607081105.993908-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_011132_608002_1F109CC3 
X-CRM114-Status: UNSURE (   9.01  )
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
 arch/riscv/kvm/vcpu_exit.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 12eebeabdf14..61305da5256d 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -154,6 +154,12 @@ void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
 	/* Clear Guest SSTATUS.SIE bit */
 	vsstatus &= ~SR_SIE;
 
+	/* Change Guest SSTATUS.SPELP bit */
+	if (vcpu->arch.cfg.henvcfg & ENVCFG_LPE) {
+		vsstatus &= ~SR_SPELP;
+		vsstatus |= vcpu->arch.guest_context.sstatus & SR_SPELP;
+	}
+
 	/* Update Guest SSTATUS */
 	ncsr_write(CSR_VSSTATUS, vsstatus);
 
-- 
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
