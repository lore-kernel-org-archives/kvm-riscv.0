Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D280C79FB9
	for <kvm-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 13:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vJiGAFfInHazqx2uyCUs3p0gHpWqqa8irJYbi9STSCY=; b=XoEbCOSrLA/cHC
	RuxNKJR0v8QM2LAQuYHRsPnnge2RELgdG4fC6sidI75aAKw2wxM2jFNUih5RtgVw/TvxuEjgXnl/j
	uKNb1RnaniWi0mtyscSfhSEiikM1pfMoVV6xrU4hcGZ5NwUJApGvq+cOQ1gempW9dWrnXOhSBXSdk
	aXo2/ZgcpQHxjfh/YvMek9o37JkecB5zokEemfW0HboWjF5Y/bRgkFIzZNJPZzMLz8sQ3w+Jr8P56
	OVK84s5YKQKPVn2VxuWbMbbAiR+rdaIoFZ6KC8NztM9tQcvTsyYOpFHEC5jfquPQG9KL7r1dHwe1z
	sfnIXqZskdGMXtPvTDOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fJG-0000000EXeu-01PP;
	Thu, 10 Sep 2026 13:59:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fJF-0000000EXee-1Sb7
	for kvm-riscv@bombadil.infradead.org;
	Thu, 10 Sep 2026 13:59:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=a8PvUIr6sHE6mWd/xzRSFBh1HE+N0XSCwjCHHa9qZcw=; b=qEdYF1PNrDv8RZFikQULs2FAih
	GB/Z23Jrap/9c7uuGf6f8kSBisGOS1tII9nqWae9ZpETGPPiTYHg+0Zs2YQWYrNLk5Q4r/OKo/0EV
	ey5nHM0fOPdjmtS99XxAQ02sodsByySkbpP7osMeXHkdVc5/RaUMumiBgKAHzQMHQqzcGMsMLuRdm
	qSjGvcWzJog8QofbCWeY8h83O+kl7L+Q9NwqompTJFXLxshQQT5rIYulEP6UiUzThg+lq4u0XhM8f
	AYhjmNK3R6N6Iaj+IvCsG3NV2Ltp5gM5YhzEQ1F+1a4sltEFjKBG4aSTReGuHBpXgw8AGHsJkKFVh
	NmRJEkPQ==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4fJB-00000002ZPN-2KpV
	for kvm-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 13:59:24 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-485888b3c3dso7151661f8f.2
        for <kvm-riscv@lists.infradead.org>; Thu, 10 Sep 2026 06:59:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789048759; cv=none;
        d=google.com; s=arc-20260327;
        b=aUcnIge6DfVFiEdq+vNX6mZHdEXWEksVAgFWgY2c0UmVsW6YW/8Cq2Ke29Ti+37HXf
         F1R0Ubmy+uGrEbfvv79OMDYhe6ACzTxQPS2LHwiiO/xotlur7WU6ZXl39/BTFI7EuxG0
         CVOLLi9xIg+4I8yXcJliWsrTKaqimFz6DdkM5RPfLr+5EZkFexDkSt2oD0m+tkNuYstf
         UhuWTiNVKOiW9yvzJ8WbGP/RLdkfn8p8yC9XXbm8Znx5M+bnwVupJdsg+KkI6rEKJeJB
         3yytnCWSHRxmz4fjaqrGiMPlF9iYgRz6barFSoML/ZbI5/sYJ+mYMo302RGB1qqHmBjH
         zYrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a8PvUIr6sHE6mWd/xzRSFBh1HE+N0XSCwjCHHa9qZcw=;
        fh=UDD9PCErPsPz+GHLK2mQ5BeNXJySdCLtvzpJgO7GuHs=;
        b=rYDc+t2+SckreWg+aDPwp6iZADZtK5X9nwtvdiXkVKKUWhPPxQfBlBdP28v2msON9p
         3ngbhSMy7Kn2uFoGkEsXesHuntmIxJSUHHpfpmqbtAeM8qtVGRRE5KLNv8zgBkKSSO/D
         GrScFW28hWbDNURa0CYQBFWirXgAHpxNiTbOY1Nlcdv3yCfS2jnOFPsQxMtKkBWMYXXh
         DDYtVYK9/rhHWeZEXNt2KQLi12JQhL8WXKWCOxcy8ipIhrvHE8J0TmQiJBwI/7DOsBY+
         BC/AbGaiur8a7AESw2H5Zvhej6NMQXU3WTD7HlNjbxZVoo0551R7vhDJ1DyEl8sV0C3T
         cyoA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789048759; x=1789653559; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a8PvUIr6sHE6mWd/xzRSFBh1HE+N0XSCwjCHHa9qZcw=;
        b=KtjxKVODLf6f/lBO4oH/ABdUgWgbhLe0ppfPGAx6b55SKBJ4ZMj0haJvktXOMz7dtb
         GLTkqdEnXsFgQCC8oD/uNO3e/4tY49kc4lsg820BL0AhEnkUpe/wEPBUjXNePnuOWNDp
         9dLmT0vKOVUOHOoYdvNVh6TLY9kxYbohTeLuBedcNfDxovvn26TtVa5enF0nBdt1nlvA
         cw7Tk8uMekFO1U3cUV7DDZ7mDeaYguIxFhHI6zxQyvEFQodXBprPBgLe6jpSyMYQd7y0
         lwOJP7R1XIDduz/Lkow+ocm/k3/eIZ7YjQi8M1kxyEVCqPUVymh3rbIEJRR/u7kgR1EP
         6wkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789048759; x=1789653559;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a8PvUIr6sHE6mWd/xzRSFBh1HE+N0XSCwjCHHa9qZcw=;
        b=UwwkyfKnQP27EZQCoWbPgcXhbhFKEyEkeG6+1j9ydj0Yq0OjrAGpveRBqHhP5+I88y
         gVyUXHYKVKNvka27QWS+eqI1oJM7HaFpYTHlqCosvsZMPcV30yC1TdC8pq6uqc07R72L
         WAhFVvJ4l4WeCB5/VRnJ+Xwgssgf6Y8uds36/6ryUqjEfAA65KEPdm2/6NVyRPZlOc/m
         2G0IPnboleQln2ubaNB0JB3j8SUSZ2UXF2AHZpRlMEEG8reDRO35T/zSf7YskVcuZdCk
         KyseZlQhZkjVMbh0npqJo9rOnx32CxtTjjH7RuywKjHU4xUVcQfSSJgl6MAYULAX4W3Z
         HY7g==
X-Gm-Message-State: AFuF++ln/sgQdIE8D0d2Q+Q3lsW0wrfINQ24ybCJiM8gIhCJ0xM9YAlZ
	eVYoGTlYk9zqG9Z2uT916JiH5kQSwN4Bs0bv8tnzMmhVVva/yKfTFxbbhPMaxZfVl5/1hgzjiyr
	t8EH/lma1aaJXJB+dIKRbzpUoCkbQGnMfrO9B3E/IOw==
X-Gm-Gg: AYBFou1eBp6tl0r0APJnM8gpazhHak8dU54dttqOb2aFQFvBetzolVxHmFKGZ6Dwi2Y
	sUXvQP83PuyS78311zkMpj6KfFN94SQKzwvqm8LxJ19gzPRi4pEDpCRF+tWiw5vvFxnwYOWt/Rl
	7sgEgpy9rNt2Oqug5UUddgS5p8yueLXM555dnssQf8Pv/qPxoOxjYIE/XXAXnlFS7yw1uq8JveS
	2lya1diKD3tmvMMIj+CwmGf1kY+SiN2QgwnNIY95Js3eS3BZmqw4VzlgAUOK0gdVS1HRfD/CCIY
	gOI3M4PPKIdo61Ysm9TLf/LB3jlOKgA9U1vgqjjIltlGfiJxSgpbDbWrFWTiyKIq7x+WMxFSOt+
	fZzBTCGvrCi+YKgylLiq/AeO8jpnYYQEgka1ripFKm214GOkCdwKFGw8MU885+JHXDBCbaiMNHw
	==
X-Received: by 2002:adf:e19e:0:b0:485:8c16:5eef with SMTP id
 ffacd0b85a97d-4858c166088mr39391128f8f.41.1789048759310; Thu, 10 Sep 2026
 06:59:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260810051544.3953925-1-xb@ultrarisc.com> <20260810051544.3953925-3-xb@ultrarisc.com>
In-Reply-To: <20260810051544.3953925-3-xb@ultrarisc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 10 Sep 2026 19:29:06 +0530
X-Gm-Features: AcwNN1W7Uqn-QGBR02QgV1a2VTJVT2tlA_caJMvDJlneztIk9EUK-XjvcF0ult4
Message-ID: <CAAhSdy2qxD9x-mvt=5yEKA+xoa8QJ9evnQkJot9n+rkxvOQukA@mail.gmail.com>
Subject: Re: [RESEND PATCH 2/2] RISC-V: KVM: Propagate interrupted G-stage faults
To: Xie Bo <xb@ultrarisc.com>
Cc: kvm-riscv@lists.infradead.org, Atish Patra <atish.patra@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_145921_676962_1882913B 
X-CRM114-Status: GOOD (  17.08  )
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
b20+IHdyb3RlOgo+Cj4gX19rdm1fZmF1bHRpbl9wZm4oKSByZXBvcnRzIGFuIGludGVycnVwdGVk
IGhvc3QgcGFnZSBmYXVsdCB3aXRoCj4gS1ZNX1BGTl9FUlJfU0lHUEVORElORy4gUklTQy1WIGN1
cnJlbnRseSBoYW5kbGVzIGl0IGFzIGEgZ2VuZXJpYyBlcnJvciBQRk4KPiBhbmQgcmV0dXJucyAt
RUZBVUxULgo+Cj4gUmV0dXJuIC1FSU5UUiBmb3IgdGhlIHNpZ25hbC1wZW5kaW5nIHNlbnRpbmVs
IHNvIGNhbGxlcnMgY2FuIGRpc3Rpbmd1aXNoCj4gYW4gaW50ZXJydXB0ZWQgZmF1bHQgZnJvbSBh
biBpbnZhbGlkIHVzZXJzcGFjZSBtYXBwaW5nLiBEbyBub3QgbG9nIHRoZQo+IGV4cGVjdGVkIGlu
dGVycnVwdGlvbiBhcyBhIHZDUFUgZXhpdCBlcnJvci4KPgo+IEZpeGVzOiA5ZDA1YzFmZWU4Mzcg
KCJSSVNDLVY6IEtWTTogSW1wbGVtZW50IHN0YWdlMiBwYWdlIHRhYmxlIHByb2dyYW1taW5nIikK
PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IFhpZSBCbyA8eGJA
dWx0cmFyaXNjLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFp
bmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIGFzIGEgZml4IGZvciBMaW51eC03LjMtcmNYCgpUaGFu
a3MsCkFudXAKCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9tbXUuYyAgICAgICB8IDIgKysKPiAg
YXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
dm0vbW11LmMgYi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+IGluZGV4IGQxODlmZDUuLjNlOTU1ZDgg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2
bS9tbXUuYwo+IEBAIC03MDgsNiArNzA4LDggQEAgaW50IGt2bV9yaXNjdl9tbXVfbWFwKHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqbWVtc2xvdCwKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZtYV9wYWdlc2hpZnQsIGN1cnJlbnQpOwo+ICAg
ICAgICAgICAgICAgICByZXR1cm4gMDsKPiAgICAgICAgIH0KPiArICAgICAgIGlmIChpc19zaWdw
ZW5kaW5nX3BmbihoZm4pKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJTlRSOwo+ICAgICAg
ICAgaWYgKGlzX2Vycm9yX25vc2xvdF9wZm4oaGZuKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJu
IC1FRkFVTFQ7Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMgYi9h
cmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYwo+IGluZGV4IDg4ZTBjMzYuLjhkMzZlYjggMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2
bS92Y3B1X2V4aXQuYwo+IEBAIC0yODMsNyArMjgzLDcgQEAgaW50IGt2bV9yaXNjdl92Y3B1X2V4
aXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuLAo+ICAgICAgICAg
fQo+Cj4gICAgICAgICAvKiBQcmludCBkZXRhaWxzIGluLWNhc2Ugb2YgZXJyb3IgKi8KPiAtICAg
ICAgIGlmIChyZXQgPCAwKSB7Cj4gKyAgICAgICBpZiAocmV0IDwgMCAmJiByZXQgIT0gLUVJTlRS
KSB7Cj4gICAgICAgICAgICAgICAgIGt2bV9lcnIoIlZDUFUgZXhpdCBlcnJvciAlZFxuIiwgcmV0
KTsKPiAgICAgICAgICAgICAgICAga3ZtX2VycigiU0VQQz0weCVseCBTU1RBVFVTPTB4JWx4IEhT
VEFUVVM9MHglbHhcbiIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgdmNwdS0+YXJjaC5ndWVz
dF9jb250ZXh0LnNlcGMsCj4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8va3ZtLXJpc2N2Cg==
