Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9D6C79F9F
	for <kvm-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 09:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K6jAIXCh4OjLTeLGOqZDxtMPtMWygCl9T5gXe9z2HYM=; b=ijs95PH5arsk2H
	SISwwlOUDgXpU1Tfst4lLHkuk8LfFmqkE1HuRBYNcVYmpfPI0rPlVH2mLzLzI6D7AzVAsNhCX+Niy
	nOn2SAzjikUed9s10p7gt/vTyjBhNLDAM7BjU7NWE+uVoNSAtfPM90AnMaiXgubtVDNk7IfYwOOdv
	pd5U4AnOjp3TVoq5kmp2c/VjTw/2t9JqQezyGi0IF6s3rTR1+ksHRPyCmZssJYESgV6YXCgNr2+DL
	B4XjyBta5EAIck1y7vp3wQ2kEif9HtnLyA3YjWv3p+vu8oFXIlmB4OP1zOF/n7bik1AwWUs8Cl1Cs
	FrRJBMLku0jHlLQsBtag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ash-0000000Dq3F-3Q4d;
	Thu, 10 Sep 2026 09:15:43 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4asf-0000000Dq1t-1jrJ
	for kvm-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 09:15:42 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843cedd129so1242667f8f.0
        for <kvm-riscv@lists.infradead.org>; Thu, 10 Sep 2026 02:15:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789031739; cv=none;
        d=google.com; s=arc-20260327;
        b=Ik24i7YLrAhLlw97ztcql0xSMhhQXrTgf+WwxX/+FFVeZnTKklDIhdiLiMDwtt1mcs
         vzsiONgR9j1tneu7+L5g+e+9i8TfLr3vej4sS540v8lXp05ULi3AFRHPlC2dXc4nCo98
         uEFFnqpxoB/2MokB88ysdOMMBnO0KSwwIzJqi89+R2OvE7Xr9eFYleHFPYKUTS9y1rZg
         ZTG34gcQw5hIYhFWQ+XCf3Vh8Iro1inX71y0EyKfdqbKgnCfRrG69p+cmlaXJnwgpHSc
         gt56QE/oZIpdnRjVRqo8IpEZuUf9MURdGwHTpA8xeSW2LiIW7OMrAkN30mOheJ06B2W5
         Mj0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y8KjL9uGsOzi2b9/HHnqJJLNPtV0wuKHesD9+5FH2qs=;
        fh=tRw5hOaCEA8f6a3l4txChBII4MU3y0YUTu6NQrtf0fs=;
        b=AxzIXBYbvgpMRifVoZdP9Rn8KxV/baFdr7Kvb/R8E/F0bqH38hnEWsxG4J2n6Nna+3
         zMp+FQ0haCfYTvnbb/+qU/0QymWzEy+qHNsnyncjyuDmQqfzY1Ge7OpCw30VIVZdWRkl
         GpVy/RYQskYCL1AyGeoUKQvwHv+gSg1xZ4UPzU3YSahwDONr+NJAYiTQ8DMEwU68ltkR
         7S5SRTwGCNNTYX4ny0Z6581lb+ijqublbpxF/3N5UDIScIG+Uj3c9vKegZg5urUczRtF
         b6kR4B+Nmga8ZgaBcn3R1cspi8LppVubh4M+4e5XfaOoCAwypbn59k/IczdtsNlWpe12
         0Kzg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789031739; x=1789636539; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y8KjL9uGsOzi2b9/HHnqJJLNPtV0wuKHesD9+5FH2qs=;
        b=lrvWwX5lhBoF2WZNv01Dzzf2ENvdSlRdYhe+QBelf11tr5SszD4yFREFCbkQnEmMG2
         zcQQY0vBwaxqS0v+Od9L9zphVzJg26XGAZdsIwGfpmjyjGtqcl2S0ja8lgY3awy3l5Fy
         6qOOxZ9LxMwC77SRe+GIQWjVg7AvlTTw73cbx9ndWDmPoJmRtJyov+Rf6Nia38pb+pdv
         UQ0tnHlKqRF5egQi9bLl0wzMKE30m99xwbfKUQMQsavrrkX0Ms+INdn2gxaLM/xi73Dv
         R7p07HCUv/O9YaEDknz81XoaSosklMofpE3qtCIr9/+O6v0H59Ucxi90hLFejD7d2s1X
         Z4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789031739; x=1789636539;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y8KjL9uGsOzi2b9/HHnqJJLNPtV0wuKHesD9+5FH2qs=;
        b=LlFwOnmvLnGtY7jaEhHOD1iulHtZ2MGRU1mNB7Zdyzm6xCmPzOTNK1PXnb5T4ABxn1
         GaJc/1Spvq2i+vKDkxQstOid47AHOG7q4W40Az23Beu8UaOfxMii2BMGpblxWm88Pqr7
         NHcAiVTcEZnZicjzBR0L4AmOIW3GY2RRRi7pJjCk8tG28Wh+O7jBGtLqs5kf5seTKhtA
         skCqKmwSkmpKoitzuoiB4YP+NNQMJIooPUwxC51G5o4wxkxOSnqs+Tk+dfhMeZyBKi9D
         fVExH5+kOpRvuVCTwV1B6hFb3+wsS2eN/McjIuDehEMm++gbb/2SdPA3r0j4QX17i+cI
         Vz2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzVIsH2JgLianZbsifZVKGejuRqmUap9TCaOim0xiyacRfJgtE+j6yJOndxvH+gLB5bxwLrN9QDhEU=@lists.infradead.org
X-Gm-Message-State: AFuF++kKm+sWgOyjnkANDfa2mkhGOhdYh3ENjvWYIUOcpexJjjKy4w9T
	BzRtuvFhzfsQMlKyw8pfLqxUJ42pOVlv2V0tGjV2oUUXkIjRosL3sR22w8HH7cnWk8TyEt4SBhb
	oSABLY3RGLxKV2YOq44Vnfbv8OzDXOI+qIJQi1GqzpA==
X-Gm-Gg: AYBFou2OdsbKNbENcwT/8xRwM2rsWiocKN4aufI4xIbt3T7bVDOqzWe15HBidYzP0Fp
	lIFLKiBuARKqO+HlsdQYzlx2KV+33eFFPxRKsTWbEW56cviIef6tHAVVqgyTVK3udC1xi3Yezk2
	6HZEwfxG8O7wC1zQu4Zkgnu0aI0KVmTSwO58Q42SrwlTJb09sFqXGxK+lkGRo+ISm/PnDUP0AVi
	ZmElCRXF4wDWmxSHebwAUYPczY0Lg68qVYIbHfsXQTUC9GFOdFTZInGRLuyy0qe0AFkDu73n5nm
	IQtHlaBa3PDMc6xh//Ag6iSoW8GpbpDXAJNs0ew9NqAQtXlB1zm6gCq3oTZSKzzsn2IdwZSwOqx
	ZTkjvPWGYm1hk5PIRt19Meoa3uFn0OURLcbp+hETejhmB0pR6E/8vdjz/nTjlvFOoSFtu7mLKsX
	JRJnUbWdd+
X-Received: by 2002:a05:6000:250c:b0:482:eab2:a752 with SMTP id
 ffacd0b85a97d-485aad9459amr22090129f8f.1.1789031739142; Thu, 10 Sep 2026
 02:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260804134018.85497-1-yang.yicong@picoheart.com>
In-Reply-To: <20260804134018.85497-1-yang.yicong@picoheart.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 10 Sep 2026 14:45:27 +0530
X-Gm-Features: AcwNN1UbvRR0hvvJQjZ5KxB16Wyg_CeKMamsyoQwMo1Bex_c9WM7c-jHwFAHtWM
Message-ID: <CAAhSdy0WBev1BAEooOHoso_aRJaBcumZpOZXahbgKbk9uJZZBQ@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Fix the conversion between vsip and hvip
To: Yicong Yang <yang.yicong@picoheart.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, alex@ghiti.fr, 
	atish.patra@linux.dev, geshijian@picoheart.com, shenyang.young@picoheart.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_021541_490351_5FD38F02 
X-CRM114-Status: GOOD (  20.77  )
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

T24gVHVlLCBBdWcgNCwgMjAyNiBhdCA3OjEw4oCvUE0gWWljb25nIFlhbmcgPHlhbmcueWljb25n
QHBpY29oZWFydC5jb20+IHdyb3RlOgo+Cj4gUGVyIEFJQSBzcGVjIDEuMCBTZWN0aW9uIDYuMy4y
LCB0aGUgaW50ZXJydXB0IG51bWJlcnMgMTMtNjMKPiBzaGFyZXMgc2FtZSBiaXQgcG9zaXRpb24g
YmV0d2VlbiByZWxhdGVkIFZTIHNoYWRvdyBDU1JzIGFuZAo+IGh5cGVydmlzb3IgQ1NScy4gU28g
dGhlcmUncyBhIHNoaWZ0IG9ubHkgZm9yIFNTSSwgU1RJIGFuZAo+IFNFSSBpbnRlcnJ1cHQuCj4K
PiBDdXJyZW50bHkgdGhlIEtWTSBhbHdheXMgZG9lcyBhIHNoaWZ0IGZvciBhbGwgdGhlIGludGVy
cnVwdHMKPiAoaW5jbHVkZSBMQ09GSSB3aXRoIG51bWJlciAxMykgd2hlbiBkb2luZyB0aGUgY29u
dmVyc2lvbgo+IGJldHdlZW4gdnNpcCBhbmQgaHZpcC4gRml4IHRoaXMgYnkgb25seSBkb2luZyBz
aGlmdCB0aGUgU1NJLAo+IFNUSSBhbmQgU0VJLiBBZGQgd3JhcHBlcnMgZm9yIGRvaW5nIHRoZSBj
b252ZXJzaW9uIGJldHdlZW4KPiB2c2lwIGFuZCBodmlwLgo+Cj4gRml4ZXM6IDE2YjBiZGU5YTM3
YyAoIlJJU0MtVjogS1ZNOiBBZGQgcGVyZiBzYW1wbGluZyBzdXBwb3J0IGZvciBndWVzdHMiKQo+
IFNpZ25lZC1vZmYtYnk6IFlpY29uZyBZYW5nIDx5YW5nLnlpY29uZ0BwaWNvaGVhcnQuY29tPgoK
TEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUXVl
dWVkIHRoaXMgYXMgZml4IGZvciBMaW51eC03LjMtcmNYCgpUaGFua3MsCkFudXAKCj4gLS0tCj4g
Q2hhbmdlIHNpbmNlIHYxOgo+IC0gcmViYXNlIG9uIC1yYzYgYW5kIGZpeGVkIHRoZSBjb25mbGlj
dAo+IC0gYWRkIGZpeCB0YWcgc2luY2UgaXQgZml4ZXMgdGhlIExDT0ZJIGluamVjdGlvbgo+IExp
bms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjYwNzIxMTQxODE1Ljgw
Njc3LTEteWFuZy55aWNvbmdAcGljb2hlYXJ0LmNvbS8KPgo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2Nzci5oICAgICAgIHwgMjAgKysrKysrKysrKysrKysrKy0tLS0KPiAgYXJjaC9yaXNjdi9r
dm0vdmNwdS5jICAgICAgICAgICAgICB8ICAzICstLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29u
ZXJlZy5jICAgICAgIHwgIDggKysrLS0tLS0KPiAgdG9vbHMvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9jc3IuaCB8IDIwICsrKysrKysrKysrKysrKystLS0tCj4gIDQgZmlsZXMgY2hhbmdlZCwgMzYg
aW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9jc3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKPiBpbmRl
eCBkODA2YTk3OWY1OTUuLjdiZmJkYTk1OGYwZiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2Nzci5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaAo+IEBA
IC0xODQsMTIgKzE4NCwyNCBAQAo+ICAjZGVmaW5lIEhHQVRQX01PREVfU0hJRlQgICAgICAgSEdB
VFAzMl9NT0RFX1NISUZUCj4gICNlbmRpZgo+Cj4gLS8qIFZTSVAgJiBIVklQIHJlbGF0aW9uICov
Cj4gKy8qCj4gKyAqIFZTSVAgJiBIVklQIHJlbGF0aW9uCj4gKyAqCj4gKyAqIFRoZSBiaXQgcG9z
aXRpb25zIGFyZSBzYW1lIGJldHdlZW4gVlNJUCBhbmQgSFZJUCBmb3IgaW50ZXJydXB0Cj4gKyAq
IG51bWJlcnMgMTMtNjMsIHdoZXJlIHRoZXJlJ3MgYSBzaGlmdCBmb3IgdGhlIFNTSSwgU1RJIGFu
ZCBTRUkuCj4gKyAqLwo+ICAjZGVmaW5lIFZTSVBfVE9fSFZJUF9TSElGVCAgICAgKElSUV9WU19T
T0ZUIC0gSVJRX1NfU09GVCkKPiAtI2RlZmluZSBWU0lQX1ZBTElEX01BU0sgICAgICAgICAgICAg
ICAgKChfQUMoMSwgVUwpIDw8IElSUV9TX1NPRlQpIHwgXAo+ICsjZGVmaW5lIFZTSVBfQklBU19N
QVNLICAgICAgICAgKChfQUMoMSwgVUwpIDw8IElSUV9TX1NPRlQpIHwgXAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIChfQUMoMSwgVUwpIDw8IElSUV9TX1RJTUVSKSB8IFwKPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoX0FDKDEsIFVMKSA8PCBJUlFfU19FWFQp
IHwgXAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChfQUMoMSwgVUwpIDw8IElS
UV9QTVVfT1ZGKSkKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoX0FDKDEsIFVM
KSA8PCBJUlFfU19FWFQpKQo+ICsjZGVmaW5lIFZTSVBfTk9fQklBU19NQVNLICAgICAgKF9BQygx
LCBVTCkgPDwgSVJRX1BNVV9PVkYpCj4gKyNkZWZpbmUgVlNJUF9WQUxJRF9NQVNLICAgICAgICAg
ICAgICAgIChWU0lQX0JJQVNfTUFTSyB8IFZTSVBfTk9fQklBU19NQVNLKQo+ICsjZGVmaW5lIHZz
aXBfdG9faHZpcChfdnNpcCkgICAgKCgoKF92c2lwKSAmIFZTSVBfQklBU19NQVNLKSA8PCBcCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFZTSVBfVE9fSFZJUF9TSElGVCkgfCBc
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKChfdnNpcCkgJiBWU0lQX05PX0JJ
QVNfTUFTSykpCj4gKyNkZWZpbmUgaHZpcF90b192c2lwKF9odmlwKSAgICAoKCgoX2h2aXApID4+
IFZTSVBfVE9fSFZJUF9TSElGVCkgJiBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFZTSVBfQklBU19NQVNLKSB8IFwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAoKF9odmlwKSAmIFZTSVBfTk9fQklBU19NQVNLKSkKPgo+ICAvKiBBSUEgQ1NSIGJpdHMgKi8K
PiAgI2RlZmluZSBUT1BJX0lJRF9TSElGVCAgICAgICAgIDE2Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IGluZGV4IDk3N2UzNmFi
ODNkMy4uNDY4OTE4MzA5ZGZmIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+
ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IEBAIC00NzUsOCArNDc1LDcgQEAgYm9vbCBr
dm1fcmlzY3ZfdmNwdV9oYXNfaW50ZXJydXB0cyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHU2NCBt
YXNrKQo+ICAgICAgICAgYm9vbCByZXQ7Cj4KPiAgICAgICAgIHJhd19zcGluX2xvY2tfaXJxc2F2
ZSgmdmNwdS0+YXJjaC5pcnFzX3BlbmRpbmdfbG9jaywgZmxhZ3MpOwo+IC0gICAgICAgaWUgPSAo
KHZjcHUtPmFyY2guZ3Vlc3RfY3NyLnZzaWUgJiBWU0lQX1ZBTElEX01BU0spCj4gLSAgICAgICAg
ICAgICAgIDw8IFZTSVBfVE9fSFZJUF9TSElGVCkgJiAodW5zaWduZWQgbG9uZyltYXNrOwo+ICsg
ICAgICAgaWUgPSB2c2lwX3RvX2h2aXAodmNwdS0+YXJjaC5ndWVzdF9jc3IudnNpZSkgJiAodW5z
aWduZWQgbG9uZyltYXNrOwo+ICAgICAgICAgaWUgfD0gdmNwdS0+YXJjaC5ndWVzdF9jc3IudnNp
ZSAmIH5JUlFfTE9DQUxfTUFTSyAmCj4gICAgICAgICAgICAgICAgICh1bnNpZ25lZCBsb25nKW1h
c2s7Cj4gICAgICAgICByZXQgPSB2Y3B1LT5hcmNoLmlycXNfcGVuZGluZ1swXSAmIGllOwo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jIGIvYXJjaC9yaXNjdi9rdm0v
dmNwdV9vbmVyZWcuYwo+IGluZGV4IDk5YjkxMDdiMWFjMS4uOWZlODI5ZWVkMTc4IDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2
bS92Y3B1X29uZXJlZy5jCj4gQEAgLTI3Miw3ICsyNzIsNyBAQCBzdGF0aWMgaW50IGt2bV9yaXNj
dl92Y3B1X2dlbmVyYWxfZ2V0X2NzcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4KPiAgICAgICAg
IGlmIChyZWdfbnVtID09IEtWTV9SRUdfUklTQ1ZfQ1NSX1JFRyhzaXApKSB7Cj4gICAgICAgICAg
ICAgICAgIGt2bV9yaXNjdl92Y3B1X2ZsdXNoX2ludGVycnVwdHModmNwdSk7Cj4gLSAgICAgICAg
ICAgICAgICpvdXRfdmFsID0gKGNzci0+aHZpcCA+PiBWU0lQX1RPX0hWSVBfU0hJRlQpICYgVlNJ
UF9WQUxJRF9NQVNLOwo+ICsgICAgICAgICAgICAgICAqb3V0X3ZhbCA9IGh2aXBfdG9fdnNpcChj
c3ItPmh2aXApOwo+ICAgICAgICAgICAgICAgICAqb3V0X3ZhbCB8PSBjc3ItPmh2aXAgJiB+SVJR
X0xPQ0FMX01BU0s7Cj4gICAgICAgICB9IGVsc2UKPiAgICAgICAgICAgICAgICAgKm91dF92YWwg
PSAoKHVuc2lnbmVkIGxvbmcgKiljc3IpW3JlZ19udW1dOwo+IEBAIC0yOTMsMTAgKzI5Myw4IEBA
IHN0YXRpYyBpbnQga3ZtX3Jpc2N2X3ZjcHVfZ2VuZXJhbF9zZXRfY3NyKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSwKPgo+ICAgICAgICAgcmVnX251bSA9IGFycmF5X2luZGV4X25vc3BlYyhyZWdfbnVt
LCByZWdzX21heCk7Cj4KPiAtICAgICAgIGlmIChyZWdfbnVtID09IEtWTV9SRUdfUklTQ1ZfQ1NS
X1JFRyhzaXApKSB7Cj4gLSAgICAgICAgICAgICAgIHJlZ192YWwgJj0gVlNJUF9WQUxJRF9NQVNL
Owo+IC0gICAgICAgICAgICAgICByZWdfdmFsIDw8PSBWU0lQX1RPX0hWSVBfU0hJRlQ7Cj4gLSAg
ICAgICB9Cj4gKyAgICAgICBpZiAocmVnX251bSA9PSBLVk1fUkVHX1JJU0NWX0NTUl9SRUcoc2lw
KSkKPiArICAgICAgICAgICAgICAgcmVnX3ZhbCA9IHZzaXBfdG9faHZpcChyZWdfdmFsKTsKPgo+
ICAgICAgICAgKCh1bnNpZ25lZCBsb25nICopY3NyKVtyZWdfbnVtXSA9IHJlZ192YWw7Cj4KPiBk
aWZmIC0tZ2l0IGEvdG9vbHMvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCBiL3Rvb2xzL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKPiBpbmRleCAyMWQ4Y2VlMDQ2MzguLjhkZjY0MzE0
ZDYxMyAxMDA2NDQKPiAtLS0gYS90b29scy9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oCj4g
KysrIGIvdG9vbHMvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaAo+IEBAIC0xNjMsMTIgKzE2
MywyNCBAQAo+ICAjZGVmaW5lIEhHQVRQX01PREVfU0hJRlQgICAgICAgSEdBVFAzMl9NT0RFX1NI
SUZUCj4gICNlbmRpZgo+Cj4gLS8qIFZTSVAgJiBIVklQIHJlbGF0aW9uICovCj4gKy8qCj4gKyAq
IFZTSVAgJiBIVklQIHJlbGF0aW9uCj4gKyAqCj4gKyAqIFRoZSBiaXQgcG9zaXRpb25zIGFyZSBz
YW1lIGJldHdlZW4gVlNJUCBhbmQgSFZJUCBmb3IgaW50ZXJydXB0Cj4gKyAqIG51bWJlcnMgMTMt
NjMsIHdoZXJlIHRoZXJlJ3MgYSBzaGlmdCBmb3IgdGhlIFNTSSwgU1RJIGFuZCBTRUkuCj4gKyAq
Lwo+ICAjZGVmaW5lIFZTSVBfVE9fSFZJUF9TSElGVCAgICAgKElSUV9WU19TT0ZUIC0gSVJRX1Nf
U09GVCkKPiAtI2RlZmluZSBWU0lQX1ZBTElEX01BU0sgICAgICAgICAgICAgICAgKChfQUMoMSwg
VUwpIDw8IElSUV9TX1NPRlQpIHwgXAo+ICsjZGVmaW5lIFZTSVBfQklBU19NQVNLICAgICAgICAg
KChfQUMoMSwgVUwpIDw8IElSUV9TX1NPRlQpIHwgXAo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIChfQUMoMSwgVUwpIDw8IElSUV9TX1RJTUVSKSB8IFwKPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAoX0FDKDEsIFVMKSA8PCBJUlFfU19FWFQpIHwgXAo+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIChfQUMoMSwgVUwpIDw8IElSUV9QTVVfT1ZGKSkK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoX0FDKDEsIFVMKSA8PCBJUlFfU19F
WFQpKQo+ICsjZGVmaW5lIFZTSVBfTk9fQklBU19NQVNLICAgICAgKF9BQygxLCBVTCkgPDwgSVJR
X1BNVV9PVkYpCj4gKyNkZWZpbmUgVlNJUF9WQUxJRF9NQVNLICAgICAgICAgICAgICAgIChWU0lQ
X0JJQVNfTUFTSyB8IFZTSVBfTk9fQklBU19NQVNLKQo+ICsjZGVmaW5lIHZzaXBfdG9faHZpcChf
dnNpcCkgICAgKCgoKF92c2lwKSAmIFZTSVBfQklBU19NQVNLKSA8PCBcCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFZTSVBfVE9fSFZJUF9TSElGVCkgfCBcCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKChfdnNpcCkgJiBWU0lQX05PX0JJQVNfTUFTSykpCj4g
KyNkZWZpbmUgaHZpcF90b192c2lwKF9odmlwKSAgICAoKCgoX2h2aXApID4+IFZTSVBfVE9fSFZJ
UF9TSElGVCkgJiBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFZTSVBfQklB
U19NQVNLKSB8IFwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoKF9odmlwKSAm
IFZTSVBfTk9fQklBU19NQVNLKSkKPgo+ICAvKiBBSUEgQ1NSIGJpdHMgKi8KPiAgI2RlZmluZSBU
T1BJX0lJRF9TSElGVCAgICAgICAgIDE2Cj4gLS0KPiAyLjUwLjEgKEFwcGxlIEdpdC0xNTUpCgot
LSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
