Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB66C79FB9
	for <kvm-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 13:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0TCdshNTiOOukWP0WJH9YyfK17IJN9dTZI/a9S9K29s=; b=eisscl2JFYJg9X
	t4WFDFJYEkp/05uH6DFiy0qxl7TayhZQiScPekzFqhl0+HTEvgetBbLgkAsVPVif13IqGWLoRAn2t
	t4cTAACHVywTK2iZ/WDKrhrXk19PSFkHq+Q5z+LlRQEmzdbDvhPLFSvcu70IUEE2IadNWWRSkJ/lD
	gPBlLvsxJ7Jp7oY0x1unlc8wbMmu0QwIz6jZQeLqYUEJbD+ZmBgyb/2qAUN+Ribqudm8g+4lo5n/0
	3+pik96mxylJxhCsI9KMHE11z+jVkv6a0REg+7K24sG2Q5zMYKbU5E9NdZG3l++Zz/QA/M4UKCWX4
	pUwnyYxNRHhK+k84uzlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fJ7-0000000EXd1-3zVa;
	Thu, 10 Sep 2026 13:59:17 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fJ4-0000000EXbz-04bT
	for kvm-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 13:59:17 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4834977ae75so1297685f8f.3
        for <kvm-riscv@lists.infradead.org>; Thu, 10 Sep 2026 06:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789048751; cv=none;
        d=google.com; s=arc-20260327;
        b=sHWtzEkCco+qEJY3EN/AzRWsinJ+obDMT+7Y5JuGx0//j4tx4JHCLikVWlE75A8jSG
         KQMz7Yx3ZyUUW+blUDYnUOldksBWuaoZU5weM/haKxXpq+OG5eMj7gWYhgxiJcskh4ys
         UG+9DG0RhqY5Vdd2qlicDM/Nkf5vTomnLc8hYJKX9Awtib6BmKdAa+3Bmxj1jXnsPlvU
         P8WROvYc9Fzr4gB1c7QKOhp+BkpqceHVeixmeUW9AGT0TRdujcAWqBJWT2qeu2Mx18Xa
         JprETBMYbuOBVasZRrtmSzWKl/JDanwy1AFXqiDHP0C+GyA82vl74nzw4Pw8IWDFtzdO
         caDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ntUgUOcZUM5+aK8XwHOyZhsMc69vpZvSuPPgaYDDMnc=;
        fh=UDD9PCErPsPz+GHLK2mQ5BeNXJySdCLtvzpJgO7GuHs=;
        b=mrlGv9o1mi3RPHge7dNtHg5wokORsL4TIjQBE7INEzURvKIzAr5c5tpQxirjvNvt6L
         f8D98YpOXaGiAWmoQtX/9TOFYtPayC8WOOif3ahG0i2PYw0mzJCWlM7TxoSQGkrhSzCK
         jvfm0q2yVRwaRQx/O/XDAOuXtatvnzTCrKV9mw7poOLe5ioXOarvD1CKemTGOrUE6cUr
         bQUWFh8SlFfBxGXxD4KpVa0on8X1frMCuqDynKarrF5DIzkx021g1TRwUjSkZbFIbSPo
         TWFDbbHy0b1VkIIXVxw822P2SLQLXgFYaXhO6m+qGM1MtxG9bMstKWkZR2BginKboSit
         BFIg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789048751; x=1789653551; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ntUgUOcZUM5+aK8XwHOyZhsMc69vpZvSuPPgaYDDMnc=;
        b=E6ddSNUMxaQaFcbERIZ7Uoz+ajwXdNpZ5UZWqXm4x9FYbzYhSHjof7jiur47/fKZ4X
         G1hnEQX3psly0fD+roMRfO4EP0lB2Q1NsmdputaLy3XIwSIZp+FeF8i2r2y/OUF6vsVO
         r3g/eAuXIWBf+HpW1MgCXUvKNKlhHAclvxHPyeu3yvluv5YhQ2/Nh6IlJGZei0PnSOE3
         Ri5NHEm80HUvIEznvo4jI/ptQghwr4WZLLiE4/a3QCkXqsn/oGmJgIcwD2SQ7igWzj4i
         pEWYI99fBiWXSTe+f4WlgcBUDJnalY4KnAEOy7dwMu4+3dmdq9eZM/7LP1+RPS48/fwh
         t/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789048751; x=1789653551;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ntUgUOcZUM5+aK8XwHOyZhsMc69vpZvSuPPgaYDDMnc=;
        b=BcMJwggmW3usPEhSdjaVijIUeikpKsD170Na6VF1OYN6+uuNnGCJ9pP03MiKVg8Yvk
         LFi2wEscPvPdJq+e/zygHMynEHAKx7ZX2k5is/h42/f19VUlp19SACVWhZgh14M0htll
         LoWkZdi9cp1MCfbjmE1O/6poGvYawAmh9+TbDOQCb4S3VJ3YxygMeNSgZutOFw9e/0V6
         zAYVakq6XjAyAb11xNd7Bh9HdU7MpvMpIR7imSCqm9i9qniaIJvdQHsx65PoFKG/7FcI
         vBuyLDAJ1RBvylFySQy6dtfAtIvZrFSxywbQ+IdMcOiaHu3RNK0oGzMAUbcLdzNofnVg
         pgOA==
X-Gm-Message-State: AFuF++mE9o0Vt4zk1CJqfunLCz78+eUso7NszxgVr9sddFFmmZadBSMf
	U+BitoVH4m79SbPc3OsG/AX4HXx2IUKArP7MdLjJwt82GrmFsRkVRPaWdTBBDK6PKzlktUEuhtf
	HNdQUmk5cJR06PVpyjgMcbhofj1q2fbQhz8nyu0SD3A==
X-Gm-Gg: AYBFou0bla3pS6hkCkfZMIvN6yTZMwm5QFe1BXD35j0UaN07SS0PbGxedCTMF4GqpTt
	lkbxHob8lhoj/llbLD3WOmvhWJ5ZNQQZEwLgYtNk5srmg2/MSgo4iuLSj4/2keFX7pTgmgjfi+h
	sYqp95IeQKYnCSIWBO1Zu4GpEJq30m4g+uhKxmvxs1529D8l30+PkIdPumLcPtvN++e7GikI+kU
	uHXw34e/rlLuIuPi5tVBxYPFdsa1c1HtJzTYuwKr9Q+xdpf9U2CWwpzznTcme+m9FHEgbOP0AxO
	qj7rLJjdp8ZgdTlwfnXVQgG/1pxCqdx+dAlnW7PD6iPKnov/n0FT5hkk1XUQQiTVKOuI6suuen1
	Y7pSuMQg08CclIRO0Wj6qahjB2W2G0sMHC5VGWlzPhm4zJEGEdqvfsCNwtvxWusI82VdcfgzY4w
	==
X-Received: by 2002:a05:6000:402c:b0:485:acfd:4fa2 with SMTP id
 ffacd0b85a97d-485acfd572dmr20259573f8f.28.1789048750919; Thu, 10 Sep 2026
 06:59:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260810051544.3953925-1-xb@ultrarisc.com> <20260810051544.3953925-2-xb@ultrarisc.com>
In-Reply-To: <20260810051544.3953925-2-xb@ultrarisc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 10 Sep 2026 19:28:58 +0530
X-Gm-Features: AcwNN1VoynwwDilW3Qq5_YgkFrLdSifis-TkUfgosx4SiSWNhFsAD_CF6I0IGk8
Message-ID: <CAAhSdy16n_zWBudDS0_E8xK=mhKBOvLMz00SRWnY0ArDkJF=qw@mail.gmail.com>
Subject: Re: [RESEND PATCH 1/2] RISC-V: KVM: Release unused page after MMU invalidation
To: Xie Bo <xb@ultrarisc.com>
Cc: kvm-riscv@lists.infradead.org, Atish Patra <atish.patra@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_065914_067348_96913261 
X-CRM114-Status: GOOD (  16.97  )
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

T24gTW9uLCBBdWcgMTAsIDIwMjYgYXQgMTA6NDbigK9BTSBYaWUgQm8gPHhiQHVsdHJhcmlzYy5j
b20+IHdyb3RlOgo+Cj4gSWYgYW4gTU1VIGludmFsaWRhdGlvbiByYWNlcyB3aXRoIGEgRy1zdGFn
ZSBmYXVsdCwgdGhlIGZhdWx0IGhhbmRsZXIgc2tpcHMKPiBpbnN0YWxsaW5nIHRoZSBwYWdlIGJ1
dCBsZWF2ZXMgcmV0IHNldCB0byB6ZXJvLiBBcyBhIHJlc3VsdCwKPiBrdm1fcmVsZWFzZV9mYXVs
dGluX3BhZ2UoKSB0cmVhdHMgdGhlIHBhZ2UgYXMgdXNlZCBhbmQgY2FuIHVubmVjZXNzYXJpbHkK
PiBtYXJrIGl0IGRpcnR5Lgo+Cj4gVHJhY2sgdGhlIGludmFsaWRhdGlvbiByZXRyeSBzZXBhcmF0
ZWx5IGFuZCByZWxlYXNlIHRoZSBwYWdlIGFzIHVudXNlZCwKPiB3aGlsZSBwcmVzZXJ2aW5nIHRo
ZSBleGlzdGluZyByZXR1cm4gdmFsdWUgc28gdGhhdCB0aGUgdkNQVSByZXRyaWVzIHRoZQo+IGZh
dWx0Lgo+Cj4gRml4ZXM6IDJlZDkwY2IwOTM4YSAoIktWTTogUklTQy1WOiBSZXRyeSBmYXVsdCBp
ZiB2bWFfbG9va3VwKCkgcmVzdWx0cyBiZWNvbWUgaW52YWxpZCIpCj4gQ2M6IHN0YWJsZUB2Z2Vy
Lmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBYaWUgQm8gPHhiQHVsdHJhcmlzYy5jb20+CgpM
R1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpRdWV1
ZWQgdGhpcyBhcyBhIGZpeCBmb3IgTGludXgtNy4zLXJjWAoKVGhhbmtzLApBbnVwCgoKPiAtLS0K
PiAgYXJjaC9yaXNjdi9rdm0vbW11LmMgfCA4ICsrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rdm0vbW11LmMgYi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+IGluZGV4IDYwMzViNWUuLmQxODlm
ZDUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiArKysgYi9hcmNoL3Jpc2N2
L2t2bS9tbXUuYwo+IEBAIC02MjcsNiArNjI3LDcgQEAgaW50IGt2bV9yaXNjdl9tbXVfbWFwKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqbWVtc2xvdCwKPiAg
ICAgICAgIGludCByZXQ7Cj4gICAgICAgICBrdm1fcGZuX3QgaGZuOwo+ICAgICAgICAgYm9vbCBp
c19odWdldGxiOwo+ICsgICAgICAgYm9vbCB1bnVzZWQgPSBmYWxzZTsKPiAgICAgICAgIGJvb2wg
d3JpdGFibGU7Cj4gICAgICAgICB1bnNpZ25lZCBpbnQgdm1hX3BhZ2VzaGlmdDsKPiAgICAgICAg
IGdmbl90IGdmbiA9IGdwYSA+PiBQQUdFX1NISUZUOwo+IEBAIC03MTksOCArNzIwLDEwIEBAIGlu
dCBrdm1fcmlzY3ZfbW11X21hcChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fbWVt
b3J5X3Nsb3QgKm1lbXNsb3QsCj4KPiAgICAgICAgIHdyaXRlX2xvY2soJmt2bS0+bW11X2xvY2sp
Owo+Cj4gLSAgICAgICBpZiAobW11X2ludmFsaWRhdGVfcmV0cnkoa3ZtLCBtbXVfc2VxKSkKPiAr
ICAgICAgIGlmIChtbXVfaW52YWxpZGF0ZV9yZXRyeShrdm0sIG1tdV9zZXEpKSB7Cj4gKyAgICAg
ICAgICAgICAgIHVudXNlZCA9IHRydWU7Cj4gICAgICAgICAgICAgICAgIGdvdG8gb3V0X3VubG9j
azsKPiArICAgICAgIH0KPgo+ICAgICAgICAgLyoKPiAgICAgICAgICAqIENoZWNrIGlmIHdlIGFy
ZSBiYWNrZWQgYnkgYSBUSFAgYW5kIHRodXMgdXNlIGJsb2NrIG1hcHBpbmcgaWYKPiBAQCAtNzQz
LDcgKzc0Niw4IEBAIGludCBrdm1fcmlzY3ZfbW11X21hcChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUs
IHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKm1lbXNsb3QsCj4gICAgICAgICAgICAgICAgIGt2bV9l
cnIoIkZhaWxlZCB0byBtYXAgaW4gRy1zdGFnZVxuIik7Cj4KPiAgb3V0X3VubG9jazoKPiAtICAg
ICAgIGt2bV9yZWxlYXNlX2ZhdWx0aW5fcGFnZShrdm0sIHBhZ2UsIHJldCAmJiByZXQgIT0gLUVF
WElTVCwgd3JpdGFibGUpOwo+ICsgICAgICAga3ZtX3JlbGVhc2VfZmF1bHRpbl9wYWdlKGt2bSwg
cGFnZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnVzZWQgfHwgKHJldCAm
JiByZXQgIT0gLUVFWElTVCksIHdyaXRhYmxlKTsKPiAgICAgICAgIHdyaXRlX3VubG9jaygma3Zt
LT5tbXVfbG9jayk7Cj4gICAgICAgICByZXR1cm4gcmV0Owo+ICB9Cj4KCi0tIAprdm0tcmlzY3Yg
bWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
