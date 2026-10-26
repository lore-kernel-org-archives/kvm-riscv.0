Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695DE60A2602
	for <kvm-riscv@archiver.kernel.org>; Mon, 26 Oct 2026 03:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dCz6k8jI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C24m/7sU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=bm3Kpko7MScx8dYL/wWq+f4en12QCgpkkTcs9p7rPrg=; b=dCz6k8jIvXKemoxraVrnieZ4nh
	kSddREzY1gnBPAkyNmpcA1XvIISOl50JFJ36uvTCIamxavVVKkzFls0rg9HSt60m+c3TaWfaBx5IA
	2k71XYROSlgaN5Ksv+I8GnliVIvzupVEv3n+sU2BV/INR21BAy12jvndfU5cwODVMifuDz5UtqDJu
	14Q6+WWAz37prB4+V8NWUvqsOflBuRmuQqTVdbJ0WNRPujY40XDcfjpWRvCnLGN7lM6A0gA/Lbna2
	z4/4JZFqf8ha305lI5WYpqY0eYCEHgKG+KRTu4kBbah5rJHmiSxDNFvm2SXxtX3QM4tMimhOq+sgP
	QxTX/qcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLBdS-00000001fpV-4A4L;
	Mon, 26 Oct 2026 03:44:35 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLBdQ-00000001fne-1OPU
	for kvm-riscv@lists.infradead.org;
	Mon, 26 Oct 2026 03:44:33 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-5364c951da4so23660271cf.1
        for <kvm-riscv@lists.infradead.org>; Sun, 25 Oct 2026 20:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792986270; x=1793591070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FuZU9Bm4L1tjpR5OE6ZUvzPtHgo0PRLa1bH4/fzLGaA=;
        b=C24m/7sUHKZVbj3+vBdPzl8+UkklUV22nk+HzKV/nuO1l/M264pFRqof/JURC31usj
         TF3N4S5Jx0x+ANcPxgrZwYTLbof7YN8XHK1dSZVn10uIdtEmZGlRfFe2R05zUeTMMva7
         19+M8BqO/Aa1EDF56ocusPbjdhiQLUKIANkytXslAAgk/ZCcBe3VrDHyMVSAuEFxI2bX
         VGtKtcpkYpX9r2mvDlfn598Jza8zjzCUJmbHHvQpeE41UbfaFYta28z/Z9uRmK99TRLN
         PP0AsAeTxnyPOnqAQL4bXi1rpsJexYcw+0EqldMusehGIBs1on9BKj0HKVn4Jeo8sGQF
         pV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792986270; x=1793591070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FuZU9Bm4L1tjpR5OE6ZUvzPtHgo0PRLa1bH4/fzLGaA=;
        b=GNucWMv5CjOBPtPUt0oNhnloGtxxhvq+8lNZGBkEGk7fLOi8xS0m1yAjS+MWHehR/2
         0KdAkKby/xMCA8aLeMMEo2WAYQAh0LI89KnSaKPr85Yq91eb68FzBzQzif/d0hJE4Tzd
         iPjRKJLj3advlOYozMJbz0WPkVKfHKQRA088jYDcEaD648bK+D+YsORfPCNhVcsHaNmU
         0mCj84Bh77lutQhsjU0fc2KoMJt4AHfzLNngXI3J2vQH9OV2Z5zo4CYXSgRjJDzEPHSd
         Z36flUB7QxFxb5E65nuRsRMz7A9Ga7mFCrAzRUjkJ8u2lPc64BgjTGjjGf2CIh/npAnl
         +Lsw==
X-Forwarded-Encrypted: i=1; AKwUvBx47Bu+kTD6FOWL2NXV+ZEmzuQR2jjgvZaiLLl3Gq/63Dln7e4FKYR/pt6cL3Di/Fxl1Ifraaexjls=@lists.infradead.org
X-Gm-Message-State: AFq9FYKPqaeWRxOWSWmF6aZ1KY00yoEHt0VB7NmXIccFrpjz5efiFlsQ
	yrmbOnTFctKGZDGPM81JJVnprBgVQbfvvk7WxU4EiUQbnyl2Mj3HIdlR
X-Gm-Gg: AYBFou3fvBkmiDwoTJQBjiTrhqTMMyVpFi52ar+U9bROavDVLbB/6VPVoCIyzEU4RKk
	enOwxCLuDCSS+I84FDF92jOYSn9ymyr3ddFw86iypfLiC2d6RuHWTzIACjemmMyZU+9PL2SbnBk
	LHj7CqV7gfKK9JlhNlUhA8Z/ZaAUVbwrrjHhth1Mzjvse33RWw5yBDXGIex/mIvl/v5nb/Vvbap
	4kYIecYVin0qOgunJspVYQet90E/aSJ20wkImQip/4ElonV0XUUrx705jALOjfiT3IJH0c6WonE
	rxXU2F6oDQAZKGsp1ZAnWYYxHQL4vpxRulB7UgFV7bddwlQ5rbTpQphC7R4oJNinDQ5dS2PRHws
	NYGwqsIAr64/71kg96o0SvuGDMaHPC5FVQrusKlZRgDrFJmwknnwpYYXZSkWGlcFCaJa7DXiNgd
	xPcaX5qU35U3GuwWq6r1AfUBZYhT1gDcJAAskX8Ov77Skep8ZDol4Q9sdSIRYEwz/pH6y+abtfu
	m+EbBSnym3PS6+4ZueyAHb2flQwvHgtUzcqKxukKmywE/pxE1yUA+NO+bhPW/RoISb1TAwzKRNv
	+iIUIwil2U8UKPUydHnlvHcE0lbjqYSGvEFrev5/OlA4IRg9Ajq0F5AyR5zd
X-Received: by 2002:ac8:6546:0:b0:536:699d:9a1c with SMTP id d75a77b69052e-5383b3509cdmr79585421cf.2.1792986270529;
        Sun, 25 Oct 2026 20:44:30 -0700 (PDT)
Received: from paul-white-HP-Pavilion-Laptop-15-cs1xxx.mynetworksettings.com ([2600:4040:ad65:1c00:4cc4:d0be:4ab6:9a0b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394c5273sm46202121cf.9.2026.10.25.20.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:44:30 -0700 (PDT)
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
Subject: [PATCH 0/2] KVM: riscv: Unify and optimize FP register loops
Date: Sun, 25 Oct 2026 23:41:25 -0400
Message-ID: <cover.1792982932.git.paul.white.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_204432_379616_B0C7160A 
X-CRM114-Status: GOOD (  15.52  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,T_SPF_TEMPERROR,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The change to both patches in this series is a 
structural/architectural one. Both functions set_reg and get_reg use 
identical code to locate the register the application specified in the 
token even though they do different things with that location 
information: the set_reg function adds data the application requested 
to send to that identified location  (in the copy_from_user function) 
while the get_reg function retrieves what data is at that identified 
location and sends it to the application (using the copy_to_user 
function). Everything else is the same. That is the only difference 
between the code. 

Therefore I was able to apply the same solution to both of the 
function's finding-the-requested-register parts (which is everything 
up until the final if statement) which were filled with redundancy. 
The solution I came up with is to create local variables for the 
entire function for all the variables of the original code that would 
be different, depending on the floating point type. Then once I ask 
whether it is a double floating point or single floating point mode, I 
assign the aforementioned variables to the values they should have for 
that mode so that when I go through the if statements that ask whether 
the requested register number is a status control register or data 
register, I only have to go through it once because the respective 
floating point values/addresses would have been assigned to the 
aforementioned local variables, so the whole code kind of changes or 
is tailored to the floating point type. 

This architectural change/solution will make the cpu execute the code 
faster (as the cpu will have less decisions to make and the bare-metal 
math used to figure out the address of the register is executed faster 
by the cpu than looking up object properties and array indexes), is 
more maintainable, and is more readable.

Paul White (2):
  KVM: riscv: Eliminate redundancy in get_reg function via pointers
  KVM: riscv: Eliminate redundancy in set_reg function via pointers

 arch/riscv/kvm/vcpu_fp.c | 128 +++++++++++++++++++++++----------------
 1 file changed, 76 insertions(+), 52 deletions(-)

-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
