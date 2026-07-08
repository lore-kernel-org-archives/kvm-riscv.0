Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884F2C44501
	for <kvm-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 03:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gugt9EKKSvx/5sb/uBXD5N2I4k3OVP/wPF7WFhjilZU=; b=ah5bp81p/7F/ON
	wl6HtddI9KASKkrgb7+h2w11WdWspTNIR5ekM9RIfIgNPzKheALjdlLVDRLkQV1XMkDNtxiPSs/Ns
	Cpp5XEn7AFfdQudgRaeHxaOENKNjNHDP1EZw1Qbo3nXeeRhj1xFmOiHbkvmsEsS4Ho3v2ctF8Lcra
	8MbJs1UUBVKXFAWWHDtVf+2tUxsj/GdoaaMzX0MlamVlPQc2VhWc8GbjXbFE5yoK2Ot00WeuWsASK
	8iVAqfsqAFknMO3KN6s4eQERHcjQ0A9nXuQ7lh4JA5fhNOyRJs9sZGrn7dzGlNYxQXRDna/eDqCYU
	IVTbDklzgEngD0ZLsW5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ5d-0000000GFzg-1c54;
	Wed, 08 Jul 2026 03:36:50 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ5L-0000000GFg7-3h0V
	for kvm-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 03:36:40 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-38101f85591so1021118a91.1
        for <kvm-riscv@lists.infradead.org>; Tue, 07 Jul 2026 20:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783481791; x=1784086591; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7uwJLmhKNEIHTwQycd7laGxNA3BK/zUUdv4a0SBN/M4=;
        b=jKSr7p87VUfcXxE87u9z62T/TFuVXKqvfZnkVKtJuuxaJqTs+4SOwdNrjq6c2RFjVg
         MFRqL0QnM8ASc3gHDD/l4f2hDB5xYQr1lc9bbRssWQt01E6rWcgWixGKrTpOYxGvzV9k
         uid/XmhcUtkju9rwLajXQBtkSCsFG2PWHoEK4/ZDgGs+Cv2mImidpRekxaooSfJDtSC/
         0NFAvXBwk3knhcepNhPKvWq0hwoAr+xxfalVzQ+Yz607z9KsXth8UKyyMk1nXFDU4VEO
         ttsyoyCKdQVPNXziJInnas7XaynfycsDYiz2oUmAIoE0/TnvssouPshVzOYiqU3VqF7a
         Jf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783481791; x=1784086591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7uwJLmhKNEIHTwQycd7laGxNA3BK/zUUdv4a0SBN/M4=;
        b=bqBoBg4EohAbgIf+fTu/UpjsJm+VnG981b6GxiBEDszitcpKQruUMA3etuJhWKZb7/
         4o/+YCC56s9O4+qO/rZbzeyEQS/vhCl/byuPrL/QlUQz9n4DCgAtVR5a54L9/pK7q4eF
         Ajt94b5z6wA0aoSR2s9zm4yQ/P4+dESdQaF7pVK2EHUNtm0/EidojmWSHGsGuGLUNMaZ
         RQ2BpRm+qHLuOoMgeUqCTapZl3yOxb6Ja7C9Bo2NIn1TRzeh+XyAbc2mNn9YIx3aDltC
         UJQtwYKyhSydlYoAhLEJXhBFNUd6tv3IMfQAT/FLmwyr8Fhe/JafIia5Ump3mKqH+oVs
         h/Gg==
X-Forwarded-Encrypted: i=1; AHgh+RrERJajQbEPG5rKXMa0GGtSvhhqLbYhCmFwiHhLkker4d2c78ND2KGMlcVFN8QMM8/VXUD6/YiIVP4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7qwChqiihZUDLR9CYPKOP6wVIJzZXUJbqZtRXXqrCDQRZ4IpR
	NAFQmd4JA3t2T6ZAoplP3rjZrbM9wZyPnVrNELQ6jCmSrwZKqqPF9uYU
X-Gm-Gg: AfdE7clwEPzpiJzRLE1JRN5wa8dAUHF9XLMjexS1UcFWhqmcqIOPTgYd7UT+xrxydzn
	yYIPV+AadTeLQ4YxfU36IdNs7IcLJwIRtZwPxeO4tT7kKOFs6sBsx4SvEvIVfwXI14ZHufqyV+k
	enop9Se+XIYd3FZr4ZoaQx9yMIK94+v+CUoY2FaEeUg5dur5HDi4eVXuFN3UnTFjbjGPTVEZ1KF
	LaGFZeguye5xa5BE3Np4KL0Yc0EOOZJRDNa8eChQ6S6T+38z64imA8lqa/eeDdeeBGToxIZxxxJ
	SEqYI32SUjkPCmkflOHnRkcgqI/VioopvqYsXK/2YInM96hiM8UzwPCM8846us0byxPgdfJOKI5
	UBDgP0sTB5ug7REgB0tBJXCmvzvpXUw+jcCw/Cmwr8e+oGKE6Da1TzzbhtIonN5Vphojmw7+iPt
	pDtRyCelD6vFWInZB6BpG/D1lI/1UfQbIZm6fpRTQ=
X-Received: by 2002:a17:90b:5544:b0:36b:de66:92c3 with SMTP id 98e67ed59e1d1-387d880b730mr5823258a91.10.1783481791130;
        Tue, 07 Jul 2026 20:36:31 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm21092850eec.29.2026.07.07.20.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:36:30 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Tue, 07 Jul 2026 20:34:30 -0700
Subject: [PATCH v3 07/17] riscv: Maintain epc on misaligned emulation error
MIME-Version: 1.0
Message-Id: <20260707-riscv_insn_table-v3-7-3f8e5f75ba97@gmail.com>
References: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
In-Reply-To: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Nam Cao <namcao@linutronix.de>, Alexandre Ghiti <alex@ghiti.fr>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Conor Dooley <conor@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
 Jesse Taube <jtaubepe@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783481777; l=1589;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=DCPKi33NYT6bX9zlswitk1aeo+c7wEE6BumaxclqcxQ=;
 b=zvComs8b88dWvy8jLEjCRmfCDTkUEyxqVH8c14cT2/SUZEuhkK2O/aL6Gz7C5H53JvlCy3eJM
 ZgtW3tHJOY9B6zTgPHaM+IBbpBPY7YSN2Dmbugepwe7vF4SZTq+lmse
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_203632_209304_2D789A00 
X-CRM114-Status: GOOD (  11.39  )
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

Currently the epc is set to zero when there is a misaligned emulation
error. This will print a misleading error message with the current epc
value of zero instead of the epc value that triggered the emulation.
Avoid setting epc to zero to maintain the state of epc.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 arch/riscv/kernel/traps_misaligned.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 81b7682e6c6d..524215a186e0 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -238,8 +238,6 @@ static int handle_scalar_misaligned_load(struct pt_regs *regs)
 	if (get_insn(regs, epc, &insn))
 		return -1;
 
-	regs->epc = 0;
-
 	if ((insn & INSN_MASK_LW) == INSN_MATCH_LW) {
 		len = 4;
 		shift = 8 * (sizeof(unsigned long) - len);
@@ -303,7 +301,6 @@ static int handle_scalar_misaligned_load(struct pt_regs *regs)
 		shift = 8 * (sizeof(ulong) - len);
 		insn = RVC_RS2S(insn) << SH_RD;
 	} else {
-		regs->epc = epc;
 		return -1;
 	}
 
@@ -349,8 +346,6 @@ static int handle_scalar_misaligned_store(struct pt_regs *regs)
 	if (get_insn(regs, epc, &insn))
 		return -1;
 
-	regs->epc = 0;
-
 	val.data_ulong = GET_RS2(insn, regs);
 
 	if ((insn & INSN_MASK_SW) == INSN_MATCH_SW) {
@@ -405,7 +400,6 @@ static int handle_scalar_misaligned_store(struct pt_regs *regs)
 		len = 2;
 		val.data_ulong = GET_RS2S(insn, regs);
 	} else {
-		regs->epc = epc;
 		return -1;
 	}
 

-- 
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
