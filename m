Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A2660A2620
	for <kvm-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 22:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0Xp5Qm61;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kDiUv/LP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ZXHMp9f51fa1LMWv0gBFHBlPIa26lynX06sia+vff3c=; b=0Xp5Qm610bHMJRbU/UQcoyBpN7
	43mgK+qEKf4NqOLgXPd90BlSNHhjruk2CnYYINv3FTTrKgx7w8EPTfUcPZwqgLIbgmA+w+xq3JvbX
	VdPMG8FMgLh/lLu0e2z2OgC/ZtmT2aQUsgl0Iil9j6+E6HDj012hFyiITX44bckWCtlzHm9REBsLj
	mjTmFkvxjp0dQdI1zZdJK54+P8dK37SmbtCDLqSEQH/kSBzdNC2aaeS7hpJW/Ym3MgO1SaOjzkJgG
	Gy2P8/U10Rh9QvqT9fdsFA3+CjQ28wkta3tquUUC3yAi/iqDpSsDO3zNC7IOGE+5iC7GmI+MYP1jw
	T9BM3M9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMCMj-000000081vj-2Lyi;
	Wed, 28 Oct 2026 22:43:29 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMCMh-000000081tw-0CcW
	for kvm-riscv@lists.infradead.org;
	Wed, 28 Oct 2026 22:43:28 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-93f36c18b75so81754585a.1
        for <kvm-riscv@lists.infradead.org>; Wed, 28 Oct 2026 15:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793227405; x=1793832205; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yECpefA28/MXqj384Qufm+rtjJRCtVDFYCVrS7mE970=;
        b=kDiUv/LP4cjPX6FihPNtG7yUBj6MQ25DoW9cQnbObOcdLUsgh12kIp8IZv4JfWn+4z
         I9zGYEsRqyH8+1vUPQNSZ5Sc5bOVci6nyKUW2729O8cZU6Uv8LJkONU8ENQCrZwY81xy
         oPAuaN56wT22SGgN3oRpO+iJoAwxioC2fDndlbjHb5f7q37SfpBtrqG44Y9Xisr2BMge
         d1TEkLGphwuPbwPaEQcrCtlhrLFbAPO/RUNJX61QYxfD/sGnxx33ni1TprkQnODBnNn+
         9PF5leruduuizlU1pkdK+9DwTrXb34LFn299pbTL3EURQYOZQvp3WfaCPv6ndRBZcTnE
         ziIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793227405; x=1793832205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yECpefA28/MXqj384Qufm+rtjJRCtVDFYCVrS7mE970=;
        b=VEQJJH7YWbo8zG8+EzmJtHiOOjClz7saBW7t3k/BjmaEHbxRInk3pvicDIljz2sC6O
         0VTfONBx4SJS3azh7dESC336sl3gWFtnSdd84X5qR3v9allTaaEzfH3bs2hksX+Ay5PL
         7vGiWzi+Av2p7cgm9qhrIEoI4xSQ5HcodoN34Ue/UAyk6K5o/8/6JfSkD4wGmwln9D+h
         83e2g6w2w43CBiNzxoVogpJRlAOp8lTWzRnf088kV5z7NoN48kvO/Kqh/4wYF+sPFVqn
         j6d55Uea7jAQxC95bSwWI+1wPMOS63kP77nEcVGMY0LvIPT/OzKX/c7vhdQbL+rWXZTj
         LaZw==
X-Forwarded-Encrypted: i=1; AKwUvByHhvtQO+CvhPyIKXJQaU2rl2ZdjETzQZh1aRv2tgPdU4qo7AcnixZ6SLpKODyU4/HyFkXgbHyak3M=@lists.infradead.org
X-Gm-Message-State: AFq9FYLlVo/a3YGJyBzA+17TVNe6TMk3TgfkT90SCu5J+UMQjJ5SOzCT
	ff9wJrR55I8WF6H2HcuUr6ub9BuDYu0+rd78hdCHWZe9y0XklUF20OCK
X-Gm-Gg: AYBFou2VobgVGyq2JjHYqStTX4Z9o7cd34BdJm8Z4fZ8zNdj7IOUB2FDuDQVSTzWR9g
	0Wuxe0UnO255dITcFvYQkRT6UUrN3rmC+KqHFG4XuWJkwbWnH+o/MCDTHBANEz3uPPPPt4QaBAb
	B79AEDF5GPS5SuCBIkZNj1fRrzPPjzTvlQ77+S8DKqb7LKOqPr2rbCFWaIQXKAgRg+WS7mZRXIB
	ZzE/L39TPLWRVoubFjP5/YUiX/T59MtGKRUNzoR/xl4oaFazTSzS9FYRlgbBPBwaYWWUsGMPYO6
	QTbWUeWW4WeHFQCuNWvjQKF34t79uXFYR3e5WKI1N7tJu8y1OMeBOOYVNzWRVC/Dn2q5IT4wNZZ
	ScZb9R6GIL0pfNMcVFbGv7HCiv6hmaByKXB/ouFUEFDZgJmYohYaQrfZba0OFQYQ7WJIb3bVEG5
	XfbfJ1hvEPaKF11DUcc2xUamAvuxc6lFitf+MDtqBP/YAE2ouP4MeG7orOVonW3m29CGwYyuyF4
	tjHLLonScUzdt+/cGOcgVInb3QdnWGOA1NhWFGTRWPHIRS37SJbsYSUBOmrG4e+gA7U+oVuZ3Ta
	BAMqKtxncgozUZ19d0h5B9NRo/NFnsxJ4x3LjfEs7BiH/xF1+KngWY6qTr0kSkgq6XVfj2d+OUP
	Ih3/2Vl+xqBP3RHcHI7sDXSJp2W/ISGCK5FVx7VfZWoMvHdOVAtY=
X-Received: by 2002:a05:620a:26a1:b0:93e:c12c:fbc8 with SMTP id af79cd13be357-94408d361damr565214385a.68.1793227404758;
        Wed, 28 Oct 2026 15:43:24 -0700 (PDT)
Received: from paul-white-HP-Pavilion-Laptop-15-cs1xxx.mynetworksettings.com ([2600:4040:ad65:1c00:b8:5aeb:4bda:886])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0787d96sm1370085685a.28.2026.10.28.15.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 15:43:24 -0700 (PDT)
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
Subject: [PATCH v2 0/2] KVM: riscv: Unify and optimize FP register loops
Date: Wed, 28 Oct 2026 18:43:07 -0400
Message-ID: <cover.1793223506.git.paul.white.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_154327_098113_AD0443E1 
X-CRM114-Status: GOOD (  16.95  )
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
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

---
v2: 
  - Both patches had the same flawed line of code. The checking if the 
    token's size was 32 or 64 bits line allowed token's with mismatched 
    sizes & types to pass. I fixed this by checking it had the right 
    size for its type by replacing the u32/u64 parts with a 
    mode-dependent local variable, byte_offset. 

Paul White (2):
  KVM: riscv: Eliminate redundancy in get_reg function via pointers
  KVM: riscv: Eliminate redundancy in set_reg function via pointers

 arch/riscv/kvm/vcpu_fp.c | 124 +++++++++++++++++++++++----------------
 1 file changed, 72 insertions(+), 52 deletions(-)

-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
