Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E85606D80D
	for <kvm-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 09:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RJpmAvlk;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EXrk+WSg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=k63zke4lS4GUhOgdDXYSvRkkg4FALKWoixyp+p6JB/g=; b=RJpmAvlkxDtMeEyXnVSwbZ3IM8
	PlsqIaCzuuTcFCvHKeo+HLnCVN4n5hXJGPaIdvphPc0bXaBE1Xf837bLaOmP60zmx30q/PC1kwtFO
	rkFg/4qaI2ung8YNydtcItpxghMO0895sVzUSzBzyKuLOwzCPO9os+2zd3XUDMYwuXlGIdFOCpGQU
	Yp7PEU+oZBlRQd/h4VS6CExDaTwbd8c/wEt5dWnECIcZ8MMgJoNF7HFmMovftqPeD2zdbL0wFceL1
	rG7lP/8X52OiIU2o+mmlN+u14fDqkBIgDWF1fJ5yNhWZWuzZ0n5xCdqu0nyTcCSdN4u/o+Y4vhZwF
	mnJR1XrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGeE-0000000BoyS-0GzS;
	Fri, 06 Nov 2026 09:54:14 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGeC-0000000BoxV-0dk9
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 09:54:13 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5bccecba199so427576e87.1
        for <kvm-riscv@lists.infradead.org>; Fri, 06 Nov 2026 01:54:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793958850; cv=none;
        d=google.com; s=arc-20260327;
        b=kKwg9VYkJoQY0XVY7l14q6Kz/PNf1Bsfh6Q1lwqrerMtIYBsFQYtZ4VP4bKcAlmGjK
         V0SqnwYI+9OxymQX23Vy4XOGccl15SK/3iEnKDpli/SmMldqIRQZjkjWM0oBBcCmYmNE
         ltQIBD6LBYUMg3ur3LW4Di+wNelFSqDQ45H2irJNlvI/B/Y9oYyWinE1vtNKUUauK+E/
         aksetSP5cFpjbaC4bOnGSPUGy6+uFRBXbYoiAiUWoBItUnG2tAIe33h+XIwS4WFjweLs
         oYnrzA7Bt8cEq6lm+A5pfZblU7KBHw4cpAbQWPVXgLj0ekFyA1SjTWzon4f/m5zjaliM
         KpsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/qUBJvia8A4m8j44qWWCxqxQxXk2NNL+JHI+sUxPvXc=;
        fh=jO4dVnj3ziqy7JE9FSQKMQw2d/tHjHGxekwO3tthqa4=;
        b=Pw8H1bLGxVd7EoxbcD0ZGPMUhSz3aXet1Rpriz2G6Mj9AUnGoC2QDmR78+DgVQamKu
         3Jky5MZr9vgvIpoRTmb4yllEyKGdIwiBVoLMMQOInD8JAx3jNRD/Jxc+Px264N3AXZMk
         qQIzled1rXhmw5+g/ugGCVr0Ws9Qc4oJpmAwMI5lEaHxh/t01uDJuY0Q+lwvFIXBO3BL
         bN3H8wu6mE0Ya3QSaBln0qxS7jBbFdkMMh+x4WqBN1Ap/32ZyCA63EzKph9i6DZvINiC
         VJAjsLpr/vNqkBMAi1UBUvvxiOsYgrCspesJNUn4e5adexG9CmlAtetaIRjS8eUuiXDM
         n65g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793958850; x=1794563650; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/qUBJvia8A4m8j44qWWCxqxQxXk2NNL+JHI+sUxPvXc=;
        b=EXrk+WSgKNWOKEkW+MQRyiF24HK5JkwZ6yW7lIGLNetsk1rZK0/Kj4EUly4cETZ7Zl
         H8UKvCnO/RxhKPWTgW8WJnWzrjJHQUr+diNd7ncYh6UPJAiOmOmqvUDF1arNr2w94M0G
         dc5mnvb8Nv5M30LQ4/carJWt7yNr3KuQ7mCyQwc0uFAYycYQOwmHn/nw7F1HqxO7weAr
         sVqkLhSBRZGJFxVQxG/rlf9vln4MJiGTs6HIXa8d5bBn6GgQyrh34YQZ537PhUtKdF+f
         tUrPecTgmBSpOfTE2hkvKmTL59kCj0ai/3cwI/Vx4WE1c41BCT5Ms58uJK9WeJT5hQ1Z
         9TKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793958850; x=1794563650;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qUBJvia8A4m8j44qWWCxqxQxXk2NNL+JHI+sUxPvXc=;
        b=oRTh4jzZjaWEjhrf46wHinq9CVUe3lxjdCbzLrIJwlrHlBdLdCfnZ9DUamIDPfN11v
         jIjW25rM0YJ7FaZTtVR6rMx59fB1Bvtn2dCl0e6Z0dTepikwfjKEFytojZm6lOpug54C
         NWxWJvQTHSvm6SuRNtsDnCdekqBgwFxQEVJp6bu4XPKOrzlGP25VaPAoW/JmEySzfywN
         vt04featgg0cNspJZqRX3KklSEHVEvdMdv026mh+1KSI8ce4Wnuvy7fHPz7PDCcX1vE3
         ND94i6BadarTiiDbjK2Z0FFfqyJCAejWxI11L9NSHvpEFjGo5LzEGSdz/lKd1U8QoFx6
         54Gw==
X-Forwarded-Encrypted: i=1; AKwUvBxWT92o7l0lv6cmW9sGgHJCyD3tiQpujHqi8cIW1MT3m3E7LPCtytS62idx3Gzx1RR6p6u277N8IhY=@lists.infradead.org
X-Gm-Message-State: APuU4Z/GXl8+5aUJWp8tasykMYNmeXuwc9djUvNrhiZjA60ozQyZQihR
	jK/FC5Uxeim5rY98pKd5RXVJJApQ5u8K9hSctPBEQnP/wI6mqtYKm6sqj6ncXlzyD6fRBS5YUP9
	svZ0Oq2LjK1yEDwCCGhb7FE+6b4W1wRw=
X-Gm-Gg: AYBFou20yBEbdjf5+hzjiCwkmUUhXSz0gg/aVTYgzJinbOUXI+vQlep3laTsSs3427i
	ijwkUbOoHknmVYdG37uN/kNiErScHXiBEwSxOEsq001HjQPqUbfWrfUwEEwSXD40zrISZmHqQAo
	vBRt020FV+c+amShr8sG0NVak/Zx8/ZOUxjX9CXlIdt9/B2UxZxMN0DlrY1BX0l15V6GKRc09cc
	huIdPYv5uMqHAM7TIvKFBBZSH68JcLLnDWxMIh8U1HXqJjE0lfWy7GYWwdCTBivAYNd1JXtbBZd
	4peBta1SmQCTmk/Kj5DuzOR2RytgvlPzA+p5LJ/osQm75c9hHlm07KJVQu3rLn8DwOvmuX8RBGN
	zZWJ3S5cYw+3nCpvl0Ha/0eSRq5jzWzMnjMzVSIhQZ8A9PBq8LtPNTlIZE2Z0kqRzBDKn
X-Received: by 2002:a05:6512:3f23:b0:5bf:c239:71ad with SMTP id
 2adb3069b0e04-5c003ad0afemr607795e87.38.1793958849775; Fri, 06 Nov 2026
 01:54:09 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261017030927.345454-1-suunj1331@gmail.com> <20261023115747.2545223-1-jinyu.tang@linux.dev>
In-Reply-To: <20261023115747.2545223-1-jinyu.tang@linux.dev>
From: SeungJu Cheon <suunj1331@gmail.com>
Date: Fri, 6 Nov 2026 18:53:57 +0900
X-Gm-Features: AclHuK9nk148RfY2GyVdkkH5dnZpSne9-B4ydq0oLeo4XvcO3mtFibrpLrfrSO0
Message-ID: <CAGwK=3r0LRuhYNWZ1Rq573qWFv9HNwHE_MxqXJa6Bfuc1QtWTg@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: Only fast-path dirty-log write faults on
 host-writable leaves
To: Jinyu Tang <jinyu.tang@linux.dev>
Cc: anup@brainfault.org, atish.patra@linux.dev, tjytimi@163.com, 
	inochiama@gmail.com, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, andrew.jones@linux.dev, 
	pbonzini@redhat.com, seanjc@google.com, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, sashiko-bot@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_015412_212413_B6D69716 
X-CRM114-Status: UNSURE (   6.69  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBPY3QgMjMsIDIwMjYgYXQgODo1N+KAr1BNIEppbnl1IFRhbmcgPGppbnl1LnRhbmdA
bGludXguZGV2PiB3cm90ZToKPiBUZXN0ZWQgb24gUUVNVSAxMC4yLjEgd2l0aCBhIHByaXZhdGUg
bWVtZmQgbWFwcGluZyBhbmQgZGlydHkgbG9nZ2luZy4KPiBBIGd1ZXN0IHJlYWQgZm9sbG93ZWQg
YnkgYSB3cml0ZSBjb3JydXB0cyB0aGUgc2hhcmVkIGJhY2tpbmcgd2l0aG91dAo+IHRoaXMgZml4
OyBhbmQgd2l0aCBpdCwgQ29XIG9jY3VycyBhbmQgdGhlIGJhY2tpbmcgc3RheXMgdW5jaGFuZ2Vk
Lgo+Cj4gUmV2aWV3ZWQtYnk6IEppbnl1IFRhbmcgPGppbnl1LnRhbmdAbGludXguZGV2Pgo+Cj4g
VGhhbmtzLAo+IEppbnl1CgpUaGFua3MgZm9yIHRlc3RpbmcgdGhpcyB3aXRoIGEgcHJpdmF0ZSBt
ZW1mZCBtYXBwaW5nIGFuZCBmb3IgdGhlCnJldmlldy4KCkknbGwgaW5jbHVkZSB0aGUgYWRkaXRp
b25hbCBmaXggcG9pbnRlZCBvdXQgYnkgU2FzaGlrbyBhbmQgSW5vY2hpCmluIHYyIGFuZCBjYXJy
eSB5b3VyIFJldmlld2VkLWJ5LCB1bmxlc3MgeW91J2QgcmF0aGVyIHRha2UgYW5vdGhlcgpsb29r
LgoKVGhhbmtzLApTZXVuZ0p1CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2t2bS1yaXNjdgo=
