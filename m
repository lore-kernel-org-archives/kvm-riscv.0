Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF6BC55174
	for <kvm-riscv@archiver.kernel.org>; Sat,  8 Aug 2026 13:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mY/F0y93PY4qOUEzxFoqDwiCgxX37DeqSVK+JQg5NR8=; b=WSe/I5A2XjFKfm
	52sE5vzNmO2Qrdm9JpwYN5p3t0jQg8UyrVNoQhEZXyWTpUfChc7gpyLQwsEe55T8ar+LyJ1m42N65
	lmGCP7UqLRxfx44tFdcL8bxPQoqZvEk8IwhtxVH4SexqDS7l4Yez7momgQjmt1Oyc8u3RNdgrwx6p
	DqS1/AhnYbWgRNYfJwLtSk1IyJLJ6+hYnCwfpPNOyh3z3m1s0/cwStSAQR55Kl144y4qIbP9rSAQ6
	D7cV1P8foW+Z27Z4Fgf80CfPqeHXS1x53LztM8FVRlIEd8suUjogJWxDmnXJtp+/IyeILHsuYwBx1
	3B2fc5IOL/byS+bAKCLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wshCT-00000009Pxn-48S4;
	Sat, 08 Aug 2026 13:34:57 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wshCR-00000009Px1-0TEj
	for kvm-riscv@lists.infradead.org;
	Sat, 08 Aug 2026 13:34:56 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so437675f8f.1
        for <kvm-riscv@lists.infradead.org>; Sat, 08 Aug 2026 06:34:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786196093; cv=none;
        d=google.com; s=arc-20260327;
        b=ESflAzvvwhsiTgaaryF0FsfO1zaxtsysMK8aOifimCkyL2DFQfKHgT7uFY+gTQDGNG
         90hCrxZ4DBbMrukxdZl5Tv0gIE3pIiyiFRKa3EDDJU2kiQh54WCz5opUfKuoUs/rpCD5
         +3oUFR5Nh13rNGWVil4ymzoJI9cXH8/0i+WKp4UllUDwU9JdjAIhMso9QxwVrevvgALt
         QDAY5o2AO8/hwyv2iypvCVMqckelxOBsTdL9Js8eKs/Kr2HQkK+jQyuWFYFq9nKnLY2W
         MvzGxEmbhxj/GJsFA29dJS4xl+kdOZTBcRbop1URaejiUSsOySpSCDN/jmNu5xVoqL3i
         T3ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yl8fdA8yXOrqRq+FEuCqTh3tBcUJBI/1F+CCsyjPVok=;
        fh=exvPiiLAY1qElSfyVpo9dU3enFkXf+gSO0J7ucmtxQA=;
        b=U/9Dhr1NZFqAyt52p50wPhBSMzIiykEcgifUFxnFOz1gbvlmid9mNbK8hzb742h4Ef
         ZnCVw9zKRhluiRQUjb770stGp4XV9IxJFHNBolsKrmZbCZq8EQUU4ZrbweIjcZYDZhjx
         2rdUoUZsUFA/cNQv5cypw0kkIVoE5fxLnN6OjwIjqFEd5yx5o+WCavb85Iy7CwAahr51
         U8YXD2h+vHeSmLf2hs0i93th4e69iiYTEKhToH9b9MLeo2M4N6qWDrgk+RExnv9H4IHE
         y2qJZwGXsBQBjIOCy1NloTgWPHNMwswdZOrQgGLrGM2h+CG4toOvynsB1EWACZT8JTio
         Y/Hg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1786196093; x=1786800893; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yl8fdA8yXOrqRq+FEuCqTh3tBcUJBI/1F+CCsyjPVok=;
        b=gTY7rXxv9qfivYeXjlUJee+VwOv4EaaJkeiTQ40CbLRYTcF7e4af0pthlWb4p+gZGb
         oG474fWEJemRkRdKm+GAuYSEaiWxQVUtalpwHdF1EI8qvfOkVpvo9XX4jhy58evODJXG
         7JC2Y96vRI5uzZkosda9hMW74nURZl1iY81qxn71tRPpuNcYdVAT2s2igVGTDLNNlZaI
         Zu++DFTZXz0IRoclwrkiEv00Vff+cGHlTqkmXVnX9YzvLZJfPwCB3umEvV8eokeYhVgv
         eTT630tDJW8l/8B30BRBFTu6g2PzfzIAEeWTf+TMaENSZbYiNepq092Z9Ex4EqSnjj5s
         ZKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786196093; x=1786800893;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yl8fdA8yXOrqRq+FEuCqTh3tBcUJBI/1F+CCsyjPVok=;
        b=T6Og7+e0lBllYouNxBQOSq0AvyPIQY3A0clUIGjgu3eyw1CJFYdXLx58N/DS4ubnmG
         nyFTpp7nU6Hm8rmnwB2IvunyupOHqOxBIn6Rzal0g/tn5cowoXUuX8OgmQTQeebfZS3O
         Sboj23JBPkDnFxay6bAFJ7nqmNO71OfcM7/qnz/0YNTVDU0o3h2KHu3uV20OVIq2DVK9
         farJ6pfjgD2Fcd4tagpcoSpvCmr2luUMBbV36FeHOlIIuCr4NFyfBcLhycpx2DpWS3do
         6RXdPm6mo/6pH7MFltO+lgqtktodkF+STq51tWMqKmabWDW+o9VpQGOlJFnA47LIuI3q
         fMkQ==
X-Forwarded-Encrypted: i=1; AHgh+RpoJ40SCwly86MuUGvzJJ8thtDdUOaIutB5ZuOqUcF6ufn8qSmjZdU0og7jY0HWPHLbnSBBU0DMkK8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzJn+549IZxhqFNKYxGIR4r+DdJBalOneRbpudjsgb7s12UWhIZ
	gYEbbnBbjhH4nVkjHRscD6Xnx+nG8fzmsWhspSUOtJFXaBkf/fdUMd/aWOnd0Tq9erYC3rtUfJ5
	drn0LzPS/V7LS+6E6Ndp9GYbT+QTiig+9LU46JHMjyg==
X-Gm-Gg: AR+sD12zfKN/zdGglm8qvBpTubhlwvJ3NQxPv97iEA+Gl+whU9ycYCZMLbI2WJsMzRV
	/CoruobrcxH4whdEuM/Ffzm+6A2Otaqdxb5ttUfw2thZgHrIYtu0bynq8lqnlgzrNAK319uddaV
	lhVK7bi0fC10TEJOL0aLcFL67MwnxP1PuEdiwwB422eRtHECq14Lvv1dmabzG5puiM8AkSYQHIG
	cX4bl+aV+VNWZVMb6XehDEqaX03/K0rTIvhfZEJOTTJqgauTCp/aN5HQPC67becHUNUEVzM8Bya
	OdsnDqAdMi8eo3vzYlL1nPWCht/kWWmWGboj8ROAFxGs7UnaV2GTFo2eg5tHhgWCqrWPreZIWGc
	07/eNhCmH7WOmVbEMzSrJl2jsw4dez956Asql8LbNXEWNP2xKMi0BBfQyytTlAupl2S96AEX+9A
	==
X-Received: by 2002:a05:6000:22c6:b0:480:d9:ee6d with SMTP id
 ffacd0b85a97d-48000d9ef38mr19159307f8f.19.1786196092900; Sat, 08 Aug 2026
 06:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260730092533.1369531-1-2045gemini@gmail.com>
In-Reply-To: <20260730092533.1369531-1-2045gemini@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 8 Aug 2026 19:04:41 +0530
X-Gm-Features: AUfX_mxF5QLiDNwWJi1r2zyquEo16mGQMd4pYVKBuDSSM2KPfXd3zXkY1Hm3xzY
Message-ID: <CAAhSdy2s7TuchTcjw7S5HQ0kEtOX1zYevNh9H4jZghaU3hHcpw@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] RISC-V: KVM: Fix PMU event info array size overflow
To: Guidong Han <2045gemini@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Naveed Khan <naveed@digiscrypt.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_063455_205873_C7F696E6 
X-CRM114-Status: GOOD (  22.02  )
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

T24gVGh1LCBKdWwgMzAsIDIwMjYgYXQgMjo1NeKAr1BNIEd1aWRvbmcgSGFuIDwyMDQ1Z2VtaW5p
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBTQkkgUE1VIEVWRU5UX0dFVF9JTkZPIHN0b3JlcyBndWVz
dC1jb250cm9sbGVkCj4gbnVtX2V2ZW50cyAqIHNpemVvZigqZWluZm8pIGluIGFuIGludC4gT24g
UlY2NCwgbnVtX2V2ZW50cyA9IDB4MTAwMDAwMDEKPiBtYWtlcyAweDEwMDAwMDAxMCB0cnVuY2F0
ZSB0byAxNi4gS1ZNIHRoZW4gYWxsb2NhdGVzIG9uZSBlbnRyeSBidXQgbG9vcHMKPiBvdmVyIHRo
ZSBvcmlnaW5hbCBudW1fZXZlbnRzLCBjYXVzaW5nIG91dC1vZi1ib3VuZHMgcmVhZHMgYW5kIHdy
aXRlcy4gQQo+IG5lc3RlZCBndWVzdCB0cmlnZ2VyZWQ6Cj4KPiBCVUc6IEtBU0FOOiBzbGFiLW91
dC1vZi1ib3VuZHMgaW4ga3ZtX3Jpc2N2X3ZjcHVfcG11X2V2ZW50X2luZm8rMHhhNC8weDE0Mgo+
IFJlYWQgb2Ygc2l6ZSA0IGF0IGFkZHIgZmY2MDAwMDAwNzRkNDZiMCBieSB0YXNrIGluaXQvMQo+
IENhbGwgVHJhY2U6Cj4gWzxmZmZmZmZmZjgwMDY0NzFjPl0ga3ZtX3Jpc2N2X3ZjcHVfcG11X2V2
ZW50X2luZm8rMHhhNC8weDE0Mgo+IFs8ZmZmZmZmZmY4MDA2OTBjMD5dIGt2bV9zYmlfZXh0X3Bt
dV9oYW5kbGVyKzB4Y2EvMHgyNjgKPiBbPGZmZmZmZmZmODAwNjc3OWU+XSBrdm1fcmlzY3ZfdmNw
dV9zYmlfZWNhbGwrMHhlYy8weDFlNgo+IFs8ZmZmZmZmZmY4MDA2MDA4Yz5dIGt2bV9yaXNjdl92
Y3B1X2V4aXQrMHg0OGMvMHg1NDAKPiBbPGZmZmZmZmZmODAwNWVhMGE+XSBrdm1fYXJjaF92Y3B1
X2lvY3RsX3J1bisweDM3ZS8weGM4MAo+IEFsbG9jYXRlZCBieSB0YXNrIDE6Cj4gIF9fa21hbGxv
Y19ub3Byb2YrMHgxOWUvMHg0YjAKPiAga3ZtX3Jpc2N2X3ZjcHVfcG11X2V2ZW50X2luZm8rMHg3
Mi8weDE0Mgo+ICBrdm1fc2JpX2V4dF9wbXVfaGFuZGxlcisweGNhLzB4MjY4Cj4gIGt2bV9yaXNj
dl92Y3B1X3NiaV9lY2FsbCsweGVjLzB4MWU2Cj4gIGt2bV9yaXNjdl92Y3B1X2V4aXQrMHg0OGMv
MHg1NDAKPiAga3ZtX2FyY2hfdmNwdV9pb2N0bF9ydW4rMHgzN2UvMHhjODAKPiBUaGUgYnVnZ3kg
YWRkcmVzcyBpcyBsb2NhdGVkIDAgYnl0ZXMgdG8gdGhlIHJpZ2h0IG9mCj4gIGFsbG9jYXRlZCAx
Ni1ieXRlIHJlZ2lvbiBbZmY2MDAwMDAwNzRkNDZhMCwgZmY2MDAwMDAwNzRkNDZiMCkKPgo+IFN0
b3JlIHRoZSBzaGFyZWQtbWVtb3J5IHNpemUgaW4gc2l6ZV90IGFuZCByZWplY3QgbXVsdGlwbGlj
YXRpb24gb3ZlcmZsb3cuCj4gQWxsb2NhdGUgdGhlIGd1ZXN0LWRyaXZlbiBhcnJheSB3aXRoIEdG
UF9LRVJORUxfQUNDT1VOVCBzbyBpdCBpcyBjaGFyZ2VkCj4gdG8ga21lbWNnLCBhbmQgdXNlIF9f
R0ZQX05PV0FSTiB0byBzdXBwcmVzcyBhbGxvY2F0aW9uIGZhaWx1cmUgd2FybmluZ3MuCj4gVXNl
IGt2Y2FsbG9jKCkgdG8gYWxsb3cgdm1hbGxvYyBmYWxsYmFjayBhbmQgYW4gdW5zaWduZWQgbG9u
ZyBsb29wIGluZGV4Cj4gdG8gbWF0Y2ggbnVtX2V2ZW50cy4KPgo+IFJlcG9ydGVkLWJ5OiBOYXZl
ZWQgS2hhbiA8bmF2ZWVkQGRpZ2lzY3J5cHQuY29tPgo+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcva3ZtLzE3ODM0NTI0NTMyNy43MjA2NS4xMzI0OTcxNjQ1MDcwODUzOTg1NEBkaWdp
c2NyeXB0LmNvbS8KPiBGaXhlczogZTMwOWZkMTEzYjlmICgiUklTQy1WOiBLVk06IEltcGxlbWVu
dCBnZXQgZXZlbnQgaW5mbyBmdW5jdGlvbiIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcK
PiBTaWduZWQtb2ZmLWJ5OiBHdWlkb25nIEhhbiA8MjA0NWdlbWluaUBnbWFpbC5jb20+CgpMR1RN
LgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpRdWV1ZWQg
dGhpcyBwYXRjaCBmb3IgTGludXgtNy4zCgpUaGFua3MsCkFudXAKCj4gLS0tCj4gUkVTRU5EOgo+
IC0gU2VuZCB2MiBhcyBhIG5ldyB0b3AtbGV2ZWwgdGhyZWFkIGluc3RlYWQgb2YgcmVwbHlpbmcg
dG8gdjEuCj4KPiBDaGFuZ2VzIGluIHYyOgo+IC0gVXNlIGFuIGFjY291bnRlZCwgbm8td2Fybmlu
ZyBrdmNhbGxvYygpIGFsbG9jYXRpb24gYW5kIGt2ZnJlZSgpLCBhcwo+ICAgc3VnZ2VzdGVkIGJ5
IFNhc2hpa28uCj4gLSBOYXZlZWQgS2hhbiByZXBvcnRlZCB0aGUgaXNzdWUgYmVmb3JlIHYxLiBJ
IG1pc3NlZCBoaXMgcmVwb3J0IGF0IHRoZQo+ICAgdGltZSwgc28gYWRkIFJlcG9ydGVkLWJ5IGFu
ZCBDbG9zZXMgdGFncyB0byBjcmVkaXQgaGltLgo+Cj4gTGluayB0byB2MTogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcva3ZtLzIwMjYwNzE4MTUzNjIwLjgyOTM3OC0xLTIwNDVnZW1pbmlAZ21haWwu
Y29tLwo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jIHwgMTQgKysrKysrKysrLS0t
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jIGIvYXJjaC9yaXNjdi9rdm0v
dmNwdV9wbXUuYwo+IGluZGV4IGJiNDZkY2JmYjI0ZC4uOGUxZjZhYmI4NGUyIDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1
X3BtdS5jCj4gQEAgLTEyLDcgKzEyLDkgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L2Vyci5oPgo+ICAj
aW5jbHVkZSA8bGludXgva3ZtX2hvc3QuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L25vc3BlYy5oPgo+
ICsjaW5jbHVkZSA8bGludXgvb3ZlcmZsb3cuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3BlcmYvcmlz
Y3ZfcG11Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gICNpbmNsdWRlIDxhc20vY3Ny
Lmg+Cj4gICNpbmNsdWRlIDxhc20va3ZtX2lzYS5oPgo+ICAjaW5jbHVkZSA8YXNtL2t2bV92Y3B1
X3NiaS5oPgo+IEBAIC00NzksMTMgKzQ4MSwxNCBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfcG11X2V2
ZW50X2luZm8oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIHNhZGRyX2xvdwo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzLCBz
dHJ1Y3Qga3ZtX3ZjcHVfc2JpX3JldHVybiAqcmV0ZGF0YSkKPiAgewo+ICAgICAgICAgc3RydWN0
IHJpc2N2X3BtdV9ldmVudF9pbmZvICplaW5mbyA9IE5VTEw7Cj4gLSAgICAgICBpbnQgc2htZW1f
c2l6ZSA9IG51bV9ldmVudHMgKiBzaXplb2YoKmVpbmZvKTsKPiArICAgICAgIHNpemVfdCBzaG1l
bV9zaXplOwo+ICAgICAgICAgZ3BhX3Qgc2htZW07Cj4gICAgICAgICB1MzIgZWlkeCwgZXR5cGU7
Cj4gICAgICAgICB1NjQgZWNvbmZpZzsKPiAgICAgICAgIGludCByZXQ7Cj4KPiAtICAgICAgIGlm
IChmbGFncyAhPSAwIHx8IChzYWRkcl9sb3cgJiAoU1pfMTYgLSAxKSB8fCBudW1fZXZlbnRzID09
IDApKSB7Cj4gKyAgICAgICBpZiAoZmxhZ3MgIT0gMCB8fCAoc2FkZHJfbG93ICYgKFNaXzE2IC0g
MSkpIHx8IG51bV9ldmVudHMgPT0gMCB8fAo+ICsgICAgICAgICAgIGNoZWNrX211bF9vdmVyZmxv
dyhudW1fZXZlbnRzLCBzaXplb2YoKmVpbmZvKSwgJnNobWVtX3NpemUpKSB7Cj4gICAgICAgICAg
ICAgICAgIHJldCA9IFNCSV9FUlJfSU5WQUxJRF9QQVJBTTsKPiAgICAgICAgICAgICAgICAgZ290
byBvdXQ7Cj4gICAgICAgICB9Cj4gQEAgLTUwMCw3ICs1MDMsOCBAQCBpbnQga3ZtX3Jpc2N2X3Zj
cHVfcG11X2V2ZW50X2luZm8oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIHNh
ZGRyX2xvdwo+ICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICB9Cj4KPiAtICAgICAgIGVpbmZv
ID0ga3phbGxvYyhzaG1lbV9zaXplLCBHRlBfS0VSTkVMKTsKPiArICAgICAgIGVpbmZvID0ga3Zj
YWxsb2MobnVtX2V2ZW50cywgc2l6ZW9mKCplaW5mbyksCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgIEdGUF9LRVJORUxfQUNDT1VOVCB8IF9fR0ZQX05PV0FSTik7Cj4gICAgICAgICBpZiAoIWVp
bmZvKSB7Cj4gICAgICAgICAgICAgICAgIHJldCA9IFNCSV9FUlJfRkFJTFVSRTsKPiAgICAgICAg
ICAgICAgICAgZ290byBvdXQ7Cj4gQEAgLTUxMiw3ICs1MTYsNyBAQCBpbnQga3ZtX3Jpc2N2X3Zj
cHVfcG11X2V2ZW50X2luZm8oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIHNh
ZGRyX2xvdwo+ICAgICAgICAgICAgICAgICBnb3RvIGZyZWVfbWVtOwo+ICAgICAgICAgfQo+Cj4g
LSAgICAgICBmb3IgKGludCBpID0gMDsgaSA8IG51bV9ldmVudHM7IGkrKykgewo+ICsgICAgICAg
Zm9yICh1bnNpZ25lZCBsb25nIGkgPSAwOyBpIDwgbnVtX2V2ZW50czsgaSsrKSB7Cj4gICAgICAg
ICAgICAgICAgIGVpZHggPSBlaW5mb1tpXS5ldmVudF9pZHg7Cj4gICAgICAgICAgICAgICAgIGV0
eXBlID0ga3ZtX3BtdV9nZXRfcGVyZl9ldmVudF90eXBlKGVpZHgpOwo+ICAgICAgICAgICAgICAg
ICBlY29uZmlnID0ga3ZtX3BtdV9nZXRfcGVyZl9ldmVudF9jb25maWcoZWlkeCwgZWluZm9baV0u
ZXZlbnRfZGF0YSk7Cj4gQEAgLTUyNSw3ICs1MjksNyBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfcG11
X2V2ZW50X2luZm8oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIHNhZGRyX2xv
dwo+ICAgICAgICAgICAgICAgICByZXQgPSBTQklfRVJSX0lOVkFMSURfQUREUkVTUzsKPgo+ICBm
cmVlX21lbToKPiAtICAgICAgIGtmcmVlKGVpbmZvKTsKPiArICAgICAgIGt2ZnJlZShlaW5mbyk7
Cj4gIG91dDoKPiAgICAgICAgIHJldGRhdGEtPmVycl92YWwgPSByZXQ7Cj4KPiAtLQo+IDIuNDMu
MAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
