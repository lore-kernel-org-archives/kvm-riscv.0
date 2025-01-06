Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8547FE7719C
	for <kvm-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 15:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+6JF5MIUnlqRV9MVlBp7ggUKHdn9YXKWveTEGx4jAys=; b=Y6PlSpk4+iNH40
	qnlWjLSHRJ2ELpoI4fewEe6Y7kRnBLKn9mu9FfAFu/1oQ2K1FjnunR8jwpeAUNAll8qlFX16ypznX
	1XFjmVBGLXIIfpAIrp+3rmxxWfsW3+tUDSYASEyjJCH7ANZq8wp0SLMc4vW9R2HBhOaYP8wqKAYhP
	jSGDmuY+nI8wXBJaeXS/Sg+Dx/eH6wrcjsnbivCRpRP1DZsfByPRw4LDvUuNdx9CtGNB1Nz+h1Ehs
	12LgaJnRvIHtJAIpu5rJsVdL6KTvla2rlHG5Rm6TrJHnsz+H/C7L8aEsEnmTf4YaLAW+Uv2nIR66b
	H7wxyIDGGkYYSiNnU1iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpNg-00000001qak-19je;
	Mon, 06 Jan 2025 15:51:04 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpMI-00000001q8r-0tpr
	for kvm-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 15:49:39 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-215770613dbso155407895ad.2
        for <kvm-riscv@lists.infradead.org>; Mon, 06 Jan 2025 07:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736178578; x=1736783378; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CcVyV1LOtw6V8Ho5gVIQl8YkyD+SXwNo0hQboe95Nr0=;
        b=ph3AREFcLMqmMhOcbRQWEq2HNeIpEu3b9bPSXz9JnHt5hiI8ZXgPLT7s+XiY6GXeLE
         04LAVABxQSxALfwhlzJPKQ9KWdYlRNgFgwbpxMD5LBZWWIn17HQnHdU1rbE2N2XARMqs
         E+Sy1S/Sxgx1HC8kqG38visRHLDfXji1t2GH3U5uB457c5PHy784mKw9/RLMHowvMAD3
         aQlMofnCZVSYZeT/gTKCi13WI8FFUuaLFS+eisCd+bolEVseAc9/dflwEhItG+vu51eS
         gqo4sqTIoOvbU5qNyMo0/Gr35mmopBNNByMImbSfvvEuZIRx0B54L92TLHIV/gwAVzKO
         nSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736178578; x=1736783378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CcVyV1LOtw6V8Ho5gVIQl8YkyD+SXwNo0hQboe95Nr0=;
        b=pOBjerW4sK7P8CN7ePJVDdGPCKnP0Vr+u1UvZ/RBNClEmM4d+7wNj32q2qJbw6f5il
         P3yD/AG7kP8Z0iGeyiQeehEbEwELWEJD6rpvdMvNpbbNUIV/41cknpZNCOBgsN9ibEDM
         QxEgm9mDx3tTMHd9oOZaO1KdG+j1kjpFrpONJh3NfkUm/xAS/Taw2f+BdqEz+vnNJoaB
         EdN+v7D1Etsa/4QnW0Lbk1xorIt9WhvNfyMeRK2W0AP3D3JB4DGrLy8R3LY9Cu+c9yBK
         Y69s2xs4XPJmDk5STEd8zvkrHvioZVd4zDpm1quc+0V4GqBT6cJzAaafHW2bLGUKrM+J
         sR0A==
X-Forwarded-Encrypted: i=1; AJvYcCV8EBo+S8sp/LKaCRIb/e8dlJfZkg3OTf4+Y3Z1GD7S011q/BSRR5DUlJ2Tuzws2pIYjJ2xqf1cNHo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyDkKV2WtgY3jAnHi7LzuYSkl6LH4F2N6hex9G+8qQKrL4d6y48
	wfeyRBQ8delX4yoGFAONBK9vgVWGlRn9J/81cpnb2KjJep8M70DLiULzu68rU1Y=
X-Gm-Gg: ASbGncu0owMyPzOfNwSmrB9wO8Y+7oDxPlTciPajPlvnWRcA+J7micCt0kf60FgrzMv
	iq+LENIrtabdymFWT52FTWl8F1J2zDGHtz/vKqLKXUz0hqxLqekXNW1n0jWbKvmRgp0UQr8Uiq1
	9EC+xf2JXrE03QPK6mdEp237mQEqeyEjITDENhuX9/ECewXqW8rU9i5Zjvoc2jGqcdcwmPcyfON
	ryJpY2/AbDKia+ps8IvSGd+uRBlLTSLEn6ySy2BGMtzJ/xeSbqGW/HNiw==
X-Google-Smtp-Source: AGHT+IFsXBphfyy9s3JHMbepbPzIKCpal6gBIDcIfNIg+T9QhHs1bx0Q0ootfBFREr+mo3N4LGUQPA==
X-Received: by 2002:a17:902:fc8e:b0:215:522d:72d6 with SMTP id d9443c01a7336-219e6f0e605mr939915245ad.38.1736178577712;
        Mon, 06 Jan 2025 07:49:37 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f6967sm292479535ad.214.2025.01.06.07.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 07:49:37 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Subject: [PATCH 5/6] riscv: export unaligned_ctl_available() as a GPL symbol
Date: Mon,  6 Jan 2025 16:48:42 +0100
Message-ID: <20250106154847.1100344-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106154847.1100344-1-cleger@rivosinc.com>
References: <20250106154847.1100344-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_074938_249617_B979C20B 
X-CRM114-Status: UNSURE (   8.81  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

VGhpcyBzeW1ib2wgd2lsbCBiZSB1c2VkIGJ5IHRoZSBLVk0gU0JJIGZpcm13YXJlIGZlYXR1cmUg
ZXh0ZW5zaW9uCmltcGxlbWVudGF0aW9uLiBTaW5jZSBLVk0gY2FuIGJlIGJ1aWx0IGFzIGEgbW9k
dWxlLCB0aGlzIG5lZWRzIHRvIGJlCmV4cG9ydGVkLiBFeHBvcnQgaXQgdXNpbmcgRVhQT1JUX1NZ
TUJPTF9HUEwoKS4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9z
aW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgfCAyICsr
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlz
YWxpZ25lZC5jCmluZGV4IDRhY2E2MDA1MjdlOS4uNzExOGQ3NDY3M2VlIDEwMDY0NAotLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvdHJhcHNfbWlzYWxpZ25lZC5jCkBAIC02ODQsNiArNjg0LDggQEAgYm9vbCB1bmFsaWduZWRf
Y3RsX2F2YWlsYWJsZSh2b2lkKQogewogCXJldHVybiB1bmFsaWduZWRfY3RsOwogfQorRVhQT1JU
X1NZTUJPTF9HUEwodW5hbGlnbmVkX2N0bF9hdmFpbGFibGUpOworCiAjZWxzZQogYm9vbCBjaGVj
a191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKHZvaWQpCiB7Ci0tIAoyLjQ3LjEK
CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
