Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E590C55182
	for <kvm-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 14:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3SwwUvDGDe5o5B1Nqh1Qr7UO+lBP47sTZcRzY1/uG9A=; b=0NeMMczDHusFeP
	ENOjJUx29/CJ/RAan3QjkWa7bbdjrG7TYAnUX4Fo/zRhWvphUZ14ZJF/5/SKHXwQzptJDmXU/SP/T
	0Uq57+9a+9LbijhvTRvxAEI73tmrBP/N0b9rQApgNMRjY3Wnfoc32A9GIwFRPmTYd2xPXXKIWgNGK
	ri0oK5M0TVwymXzNkaSGZIDjn/pYTMDwcdcL+phYtvGs8lo7x4BTfrob95n1WfKDTnv+LWfsROCLg
	MJFJMCNU4vk9rA5SRb296RxrVeR9q/opW1QTsCxBzq+MqPVT1kRLuvogUtOxLNwNGY612cy1gJFrD
	QJH4iDCz+j0aTvqZfrjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtYl-0000000HNlF-2rQb;
	Mon, 03 Aug 2026 14:22:31 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtYi-0000000HNjk-23dM
	for kvm-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 14:22:30 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-4728c12ba97so1793078f8f.0
        for <kvm-riscv@lists.infradead.org>; Mon, 03 Aug 2026 07:22:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785766946; cv=none;
        d=google.com; s=arc-20260327;
        b=bbnyxbkcvbw1JimPzozROKDJcvDYbLGXhCVWjYRDwCc5Qu0BA8u5i8Amp+1qeopdQd
         YOAsMT9w/gw88amlbEaZDWB9wZ6nUOXRXVqsABrA0Ui+eoHjTwjUaXcRvR37wVDNJVDn
         s60ZSn1gG0gFDfnhc6KVIEt5kefZk00eyGN2DmKndkFQiLYP/Yj4fxvto+Gt2SnBh0At
         Cxb6ozbtuogyp0Qyzsvtf00CKrvAA81T4HavFC0bQ6qQDQVoPNgrABh4w2QjHQlIBV45
         2Q6x4uDHCKlRTcRiFQPrgvwwnoLMuFRWZ1y0xyHhO4yVt2vgXpwFKZJXqfXwTFgticHW
         oC5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nnW4RZTqOdHnNX2YCN/ivfsmi8KlSc6lQLWkmG08CIs=;
        fh=dZ7jhJEd/DaY2ElMBRdQdij4YquYT/cd8AaTd98oc08=;
        b=iYTiiU8uCZ/ntG1ZGI2Jnfq+6HbABH7p58GvSPpYTrrmEkcV2U70Ql77yGoKhUB1vf
         YJXqqfNHmEbd59rnRzZTMoOfO0ZcP/ZCtY5TM/7DtGPDWAHSsLvTdvs+0KvXJDo7LRfT
         PbWa+xeyRQR5DE4QJ4sX3UEE9J/fe91IvpxahzTuF6zcUwCkr/9/XeWTEMCoCMRHlWRb
         b/QMo44p06DoVBYSn5AE/8dY5DCXMaRdjJW7C2szi14xlnsyjETJ86MR3KuEmG+vNItF
         0mG6kmjfUlYBKFkSnMF5r2zb65GNIM0HB5TJBgZ9NdO1FY0Y2ZtwPgYD+7V0l/gx/XyJ
         qhgQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1785766946; x=1786371746; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nnW4RZTqOdHnNX2YCN/ivfsmi8KlSc6lQLWkmG08CIs=;
        b=bMocJlJUPB9pRvdIPaa5axMB73VLOR6Wif3u6MdrhJ196ahPwqO/+kdLWE+X53foWv
         LtcaxLN7mDTk1XKCE0ETHUNu89g4QR8F3AVr+KHkODIwgIvLNcSqsVAR05IvXNKB/bPr
         Zpb4EUeAvxEfNe6Gu1BGYKVfNLyMX3SvoJuJvd3D7QEWEXew1lKD2mKZqPkRJkgvXkx0
         q1iSK8okKBcsvDtda0V476jp4IygtVMAVieEhmXWz1k7rJGyjNfJesviKBNTZQSM83Pe
         +Y9Ltg7CGvrfcJsGiTq4jsKYAELkLZX8RdpW+zHrDYNCJD7vLk8H32H0ZValHyjsCJnY
         KCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766946; x=1786371746;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nnW4RZTqOdHnNX2YCN/ivfsmi8KlSc6lQLWkmG08CIs=;
        b=Lrr0dbQGst1teNJMOv5hqMUe2S1kcDSwDfwe7bl+HyvkPHd1KMQRz1d6dWsLL5ODOm
         A7AnVPBpDEPhcLYvIOITMglSM+xkaXKlF2X8sktw/dwMj3femJr/+OCMGRg6PbwjEB96
         fmie7oME26z3cA5GRjr8/TWOdrsPE7SCJ7fhXWfjFyHce/j18xcG6m/ZZAFL1Vcjk2Rj
         H2dpzS9orkoMiISfNMzI20Yg/qP0cf0KWMfAguSp4e4++SRDW+grUKqfJsmxzmq8duxN
         bjH9k9nNY+4WGvfsdYURQeW5FJHj4Sig7ogfx3KLvnULBTjuE7EkulHd4IBBf/ri45tR
         OIGA==
X-Forwarded-Encrypted: i=1; AHgh+RrZRmlkEEHX6sQ9XD+m4mDC1yoZ/i4qaZPGAKTEhjKfmQ38MhlcoPtCYxAlmpVW0o4jUxE+D6AJhlE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy80zgpceax0WnGNgLOM4ReV/QPREgITWFGcuZBUrFm3X86zyCO
	gPsUDnrRRJraPpF/1bcPrvDAgbYdiceamjAyDFLHMY+IHgSmshiWZYQ3B2y470Log1KunJYFGWk
	gcFAO7bYXUKRuQh8QbL6gIFVMXmeWsaqNBsfcgy3Bcw==
X-Gm-Gg: AR+sD13wb0N/EZFgJEw2n60NeOP7a8NnsCqC3dgTYYv6GhSjd/akJQci81owvZDI6H/
	RIb292tlKgHS3uULVzI/wts5wEitfEDEtpqZ1ED/bJS0O21ZiO6w70wYi3bUwAYduNy+jTJHs3X
	QbHdN5XIgsc+8/rM4d6j25YOqUGnu+Ouu0Xa5F7WJ2nwyZINqDwZY1d+02W+qH/IaJ4XlOa6HVe
	3Kh1CHcrTnb5cC45z6reRIT1Pja+ntb/zssaCAMBVxuxRja3JXUI/xCkP4G+97lRiuz1Kn4mc2G
	1RIMi8RavQ59sp0HBrutIhmo1EqxCq46fSY9RVMMj5ogpmk4+lP2Lq6YLCDyqAFBgAcnFeDg+c8
	OMxA2DsF9oTYItfPvrLWWM3A5JqEikT3XHjurVwUkwpbqjTcvGskZqOKnUMZVD/2H
X-Received: by 2002:a05:6000:2209:b0:47f:9822:d99b with SMTP id
 ffacd0b85a97d-47fd7251edamr27970002f8f.0.1785766945662; Mon, 03 Aug 2026
 07:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260802050015.104795-1-guoyaxing@bosc.ac.cn>
In-Reply-To: <20260802050015.104795-1-guoyaxing@bosc.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 3 Aug 2026 19:52:14 +0530
X-Gm-Features: AUfX_myXIqx2WOmWzoJ4yL_SBCfdvCijmO0NjkJNDBHMHzLnarxMlDom9ViiKt8
Message-ID: <CAAhSdy3QE6Fe_fanKOLHLjDCb+vsVax=wy18UxzR23XN7ggJGw@mail.gmail.com>
Subject: Re: [RFC] RISC-V KVM: guest local sfence.vma may miss stale VS-stage
 TLB after vCPU migration
To: Yaxing Guo <guoyaxing@bosc.ac.cn>
Cc: Atish Patra <atish.patra@linux.dev>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Hui Min Mina Chou <minachou@andestech.com>, majiuyue@bosc.ac.cn, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_072228_581320_C7C9BEB2 
X-CRM114-Status: GOOD (  37.16  )
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

T24gU3VuLCBBdWcgMiwgMjAyNiBhdCAxMDozMOKAr0FNIFlheGluZyBHdW8gPGd1b3lheGluZ0Bi
b3NjLmFjLmNuPiB3cm90ZToKPgo+IEhpIGFsbCwKPgo+IEkgd291bGQgbGlrZSB0byBhc2sgd2hl
dGhlciBSSVNDLVYgS1ZNIGhhcyBhIGdhcCBhcm91bmQgZ3Vlc3Qgc2ZlbmNlLnZtYQo+IGFuZCBW
Uy1zdGFnZSBUTEIgaW52YWxpZGF0aW9uIHdoZW4gYSB2Q1BVIG1pZ3JhdGVzIGFjcm9zcyBob3N0
IENQVXMuCj4KPiBPbiBiYXJlIG1ldGFsLCBMaW51eCB1c2VzIG1tX2NwdW1hc2sgaW4gX19mbHVz
aF90bGJfcmFuZ2UoKSB0byBkZWNpZGUKPiB3aGV0aGVyIHRvIHNlbmQgYSBsb2NhbCBvciByZW1v
dGUgc2ZlbmNlLnZtYS4gVGhhdCB3b3JrcyBiZWNhdXNlIHRoZSBjcHVtYXNrCj4gcmVmbGVjdHMg
cGh5c2ljYWwgQ1BVcy4gSW4gYSBndWVzdCwgaG93ZXZlciwgdGhlIGtlcm5lbCBvbmx5IHNlZXMg
dkNQVXMsIHNvCj4gZnJvbSB0aGUgZ3Vlc3QgcG9pbnQgb2YgdmlldyBhIHRhc2sgbWF5IG5ldmVy
ICJtaWdyYXRlIiBldmVuIHRob3VnaCB0aGUKPiB1bmRlcmx5aW5nIHZDUFUgbW92ZWQgdG8gYSBk
aWZmZXJlbnQgaG9zdCBDUFUuIEluIG90aGVyIHdvcmRzLCBndWVzdAo+IG1tX2NwdW1hc2sgaXMg
ZWZmZWN0aXZlbHkgYSB2Q1BVIG1hc2ssIG5vdCBhIGhvc3QgQ1BVIG1hc2suCj4KPiBUaGVyZSBp
cyBhbHNvIGEgcmVsYXRlZCBzd2l0Y2hfbW0oKS9zZXRfbW1fYXNpZCgpIGFzcGVjdC4gV2l0aCB0
aGUgQVNJRAo+IGFsbG9jYXRvciBlbmFibGVkLCBSSVNDLVYgTGludXggZG9lcyBub3QgZmx1c2gg
b24gZXZlcnkgY29udGV4dCBzd2l0Y2guIEEKPiBsb2NhbF9mbHVzaF90bGJfYWxsKCkgaXMgb25s
eSBkb25lIHdoZW4gYSBkZWZlcnJlZCBBU0lEIHJvbGxvdmVyIGZsdXNoIGlzCj4gcGVuZGluZyBm
b3IgdGhlIGN1cnJlbnQgQ1BVLiBUaGF0IGlzIGZpbmUgb24gYmFyZSBtZXRhbCwgYmVjYXVzZSBw
cmV2aW91cwo+IHNob290ZG93bnMgYXJlIGFsc28gYmFzZWQgb24gcGh5c2ljYWwgQ1BVcy4gSW4g
YSBndWVzdCwgaG93ZXZlciwgdGhlIGVhcmxpZXIKPiBzaG9vdGRvd24gbWF5IGhhdmUgYmVlbiBv
bmx5IGEgZ3Vlc3QtbG9jYWwgc2ZlbmNlLnZtYSBhbmQgbWF5IGhhdmUgbWlzc2VkIGFuCj4gb2xk
IGhvc3QgQ1BVIHdoZXJlIHRoZSBzYW1lIHZDUFUgcmFuIHByZXZpb3VzbHkuCj4KPiBBIHNpbXBs
aWZpZWQgc2VxdWVuY2UgaXM6Cj4KPiAxLiBBIGd1ZXN0IHRhc2sgd2l0aCBtbSBBIHJ1bnMgb24g
dmNwdTAgd2hpbGUgdmNwdTAgaXMgc2NoZWR1bGVkIG9uIGhvc3QKPiAgICBDUFUxLiBDUFUxIGZp
bGxzIGEgVlMtc3RhZ2UgVExCIGVudHJ5IGZvciB0aGF0IG1tL0FTSUQuCj4gMi4gdmNwdTAgbWln
cmF0ZXMgdG8gaG9zdCBDUFUwLiBLVk0ncyB2Q1BVIG1pZ3JhdGlvbiBzYW5pdGl6YXRpb24gaXMg
bG9jYWwKPiAgICB0byB0aGUgY3VycmVudCBob3N0IENQVSwgc28gaXQgZG9lcyBub3QgaW52YWxp
ZGF0ZSB0aGUgVlMtc3RhZ2UgVExCIGVudHJ5Cj4gICAgdGhhdCB3YXMgbGVmdCBvbiBob3N0IENQ
VTEuCgpXaGVuIHZjcHUwIG1pZ3JhdGVzIHRvIGhvc3QgQ1BVMCwgdGhlIGhvc3QgQ1BVMCBtYXkg
b3IgbWF5IG5vdCBoYXZlClZTLXN0YWdlIFRMQiBlbnRyeSBzbyBWQ1BVIG1pZ3JhdGlvbiBzYW5p
dGl6YXRpb24gZG9lcyB0aGUgcmlnaHQgdGhpbmcuCgpJbiB0aGUgZnV0dXJlLCB2Y3B1MCBtYXkg
YWdhaW4gbW92ZSBiYWNrIHRvIGhvc3QgQ1BVMSBjb250YWluaW5nIHN0YWxlClZTLXN0YWdlIFRM
QiBlbnRyaWVzIGxlZnQgaW4gc3RlcDEgYWJvdmUgc28gdGhlIFZDUFUgbWlncmF0aW9uIHNhbml0
aXphdGlvbgp3aWxsIGNsZWFudXAgdGhlc2Ugc3RhbGUgVExCIGVudGVyaWVzLgoKPiAzLiBUaGUg
Z3Vlc3QgbGF0ZXIgdXBkYXRlcyBtbSBBJ3MgcGFnZSB0YWJsZSBmcm9tIHZjcHUwLCBmb3IgZXhh
bXBsZSBkdWUgdG8KPiAgICBDT1cuIFNpbmNlIHRoZSBndWVzdCBzdGlsbCBzZWVzIG1tIEEgYXMg
aGF2aW5nIHJ1biBvbmx5IG9uIGd1ZXN0IENQVTAsCj4gICAgX19mbHVzaF90bGJfcmFuZ2UoKSBj
YW4gY2hvb3NlIGEgbG9jYWwgc2ZlbmNlLnZtYS4gVGhhdCBsb2NhbCBzZmVuY2Uudm1hCj4gICAg
b25seSBhZmZlY3RzIGhvc3QgQ1BVMCwgd2hlcmUgdmNwdTAgaXMgY3VycmVudGx5IHJ1bm5pbmcs
IHNvIHRoZSBzdGFsZQo+ICAgIFZTLXN0YWdlIGVudHJ5IG9uIGhvc3QgQ1BVMSByZW1haW5zLgoK
Tm8gbmVlZCB0byB3b3JyeSBhYm91dCBzdGFsZSBWUy1zdGFnZSBlbnRyeSBvbiBob3N0IENQVTEg
YmVjYXVzZSB0aGVzZQp3aWxsIGFnZS1vdXQgb3Igc2FtZSBndWVzdCBtYXkgYWdhaW4gbW92ZSB0
byBob3N0IENQVTEgcmVzdWx0aW5nIGluClZDUFUgbWlncmF0aW9uIHNhbml0aXphdGlvbi4KCj4g
NC4gTGF0ZXIsIHRoZSB0YXNrIGlzIHNjaGVkdWxlZCBhZ2FpbiB3aGlsZSB2Y3B1MCBpcyBydW5u
aW5nIG9uIGhvc3QgQ1BVMS4KPiAgICBJZiB0aGUgQVNJRCBpcyBzdGlsbCB2YWxpZCBhbmQgbm8g
ZGVmZXJyZWQgQVNJRCByb2xsb3ZlciBmbHVzaCBpcyBwZW5kaW5nLAo+ICAgIHNldF9tbV9hc2lk
KCkgbWF5IG5vdCBpc3N1ZSBhbnkgZmx1c2guIFRoZSBhY2Nlc3Mgb24gaG9zdCBDUFUxIGNhbiB0
aGVuCj4gICAgaGl0IHRoZSBvbGQgVlMtc3RhZ2UgVExCIGVudHJ5LgoKU2VlIGFib3ZlIGNvbW1l
bnRzLgoKPgo+IFdlIGhpdCB0aGlzIG9uIGEgWGlhbmdTaGFuIFJJU0MtViBzeXN0ZW0uIEEgYmFz
aCB0YXNrIGluIHRoZSBndWVzdCB3YXMKPiBzY2hlZHVsZWQgb24gdmNwdTAgd2hpbGUgdGhhdCB2
Q1BVIHdhcyBydW5uaW5nIG9uIGhvc3QgQ1BVMS4gQSByZWFkLW9ubHkKPiBwYWdlIHdhcyBwcmVm
ZXRjaGVkIGFuZCBjYWNoZWQgaW4gQ1BVMSdzIFZTLXN0YWdlIFRMQi4gTGF0ZXIgdGhlIHNhbWUg
dkNQVQo+IG1pZ3JhdGVkIHRvIGhvc3QgQ1BVMCwgdGhlIGd1ZXN0IHRyaWdnZXJlZCBDT1cgYW5k
IHVwZGF0ZWQgdGhlIG1hcHBpbmcsIGFuZAo+IHRoZSBndWVzdCBzdGlsbCBpc3N1ZWQgb25seSBh
IGxvY2FsIHNmZW5jZS52bWEuIFRoZSBzdGFsZSBWUy1zdGFnZSBlbnRyeSBvbgo+IENQVTEgd2Fz
IG5vdCBpbnZhbGlkYXRlZC4gQWZ0ZXIgcnVubmluZyBmb3Igc29tZSB0aW1lLCB0aGUgdGFzayBs
YXRlcgo+IGFjY2Vzc2VkIHRoYXQgbWFwcGluZyB3aGlsZSBydW5uaW5nIG9uIGhvc3QgQ1BVMSBh
Z2FpbiBhbmQgaGl0IHRoZSBzdGFsZQo+IHRyYW5zbGF0aW9uLiBUaGUgZGF0YSBpbiB0aGF0IHBh
Z2Ugd2FzIGEgcG9pbnRlciBmcm9tIHRoZSBHT1QsIHNvIGl0Cj4gZGVyZWZlcmVuY2VkIHRvIE5V
TEwgYW5kIGV2ZW50dWFsbHkgY2F1c2VkIGEgc2VnbWVudGF0aW9uIGZhdWx0LgoKVGhlIGFib3Zl
IGV4YW1wbGUgaXMgYWxyZWFkeSB0YWtlbiBjYXJlIGJ5IFRMQiBmbHVzaGVzIGluIEtWTSBSSVND
LVYuClRoaXMgc21lbGxzIGxpa2Ugc29tZSBIVyBlcnJhdGEgdG8gbWUuCgo+Cj4gSSBjaGVja2Vk
IGN1cnJlbnQgdXBzdHJlYW0gUklTQy1WIEtWTSAodjcuMC4yKSBhbmQgSSBkbyBub3Qgc2VlIEhT
VEFUVVMuVlRWTQo+IGJlaW5nIGVuYWJsZWQsIHNvIGd1ZXN0IHNmZW5jZS52bWEgaXMgbm90IHRy
YXBwZWQuIEkgZm91bmQKPiBrdm1fcmlzY3ZfbG9jYWxfdGxiX3Nhbml0aXplKCkgb24gaG9zdCBD
UFUgbWlncmF0aW9uLCB3aGljaCBoYW5kbGVzIEctc3RhZ2UKPiBWTUlEIGVudHJpZXMgb24gdGhl
IGN1cnJlbnQgaG9zdCBDUFUsIGJ1dCBJIGRvIG5vdCB0aGluayBpdCBnZW5lcmFsbHkgc29sdmVz
Cj4gdGhlIHN0YWxlIFZTLXN0YWdlIFRMQiBjYXNlIGRlc2NyaWJlZCBhYm92ZS4KPgo+IEkgYWxz
byBub3RpY2VkIHRoZSB2ZW5kb3Itc3BlY2lmaWMga3ZtX3Jpc2N2X3Zzc3RhZ2VfdGxiX25vX2dw
YSBwYXRoIGluCj4gY3VycmVudCB1cHN0cmVhbS4gSXQgbG9va3MgbGlrZSBhIHdvcmthcm91bmQg
Zm9yIGEgcGFydGljdWxhciBpbXBsZW1lbnRhdGlvbgo+IGlzc3VlIG9uIEFuZGVzIEFYNjYsIHdo
ZXJlIHRoZSBWUy1zdGFnZSBUTEIgZG9lcyBub3QgY2FjaGUgZ3Vlc3QgcGh5c2ljYWwKPiBhZGRy
ZXNzIGFuZCBWTUlELCBzbyB0aGUgbm9ybWFsIFZNSUQvR1BBLWJhc2VkIGludmFsaWRhdGlvbiBt
b2RlbCBpcwo+IGluc3VmZmljaWVudC4gSW4gdGhhdCBzZW5zZSwgaXQgZG9lcyBub3Qgc2VlbSB0
byBiZSBhIGdlbmVyaWMgc29sdXRpb24gZm9yCj4gZ3Vlc3Qgc2ZlbmNlLnZtYSBjb2hlcmVuY2Ug
YWNyb3NzIHZDUFUgbWlncmF0aW9uLgo+Cj4gSSBhbSB3b25kZXJpbmcgd2hhdCB0aGUgcmlnaHQg
ZGlyZWN0aW9uIHNob3VsZCBiZS4gRW5hYmxpbmcgSFNUQVRVUy5WVFZNIGFuZAo+IHRyYXBwaW5n
IGd1ZXN0IHNmZW5jZS52bWEgd291bGQgYWxsb3cgS1ZNIHRvIHRyYW5zbGF0ZSBndWVzdCBsb2Nh
bCBzZmVuY2Uudm1hCj4gaW50byB0aGUgcmVxdWlyZWQgaG9zdC1zaWRlIGhmZW5jZS52dm1hLCBi
dXQgdGhhdCBtYXkgYmUgdG9vIGhlYXZ5IGZvciB0aGUKPiBjb21tb24gY2FzZS4gQW5vdGhlciBw
b3NzaWJsZSBkaXJlY3Rpb24gbWF5IGJlIHRvIG1ha2UgdGhlIGN1cnJlbnQKPiBBbmRlcy1zcGVj
aWZpYyB2Q1BVIG1pZ3JhdGlvbiBmbHVzaCBsb2dpYyBtb3JlIGdlbmVyaWMsIHNvIGltcGxlbWVu
dGF0aW9ucwo+IHRoYXQgbmVlZCBWUy1zdGFnZSBUTEIgc2FuaXRpemF0aW9uIG9uIHZDUFUgbWln
cmF0aW9uIGNhbiBvcHQgaW4gdGhyb3VnaCBhCj4gY29tbW9uIG1lY2hhbmlzbS4gQSB0aGlyZCBw
b3NzaWJpbGl0eSBtYXkgYmUgdG8gZGVmaW5lIGEgbGlnaHR3ZWlnaHQgU0JJCj4gaW50ZXJmYWNl
IGZvciBndWVzdCBsb2NhbCBzZmVuY2Uudm1hLCBzbyBMaW51eCBjb3VsZCB1c2UgaXQgaW4KPiBf
X2ZsdXNoX3RsYl9yYW5nZSgpIGZvciB0aGUgbG9jYWwgY2FzZSB3aGVuIHJ1bm5pbmcgdW5kZXIg
S1ZNLCBhbmQgS1ZNIGNvdWxkCj4gdGhlbiBkZWNpZGUgd2hldGhlciBhIGxvY2FsIHNmZW5jZS52
bWEgaXMgc3VmZmljaWVudCBvciB3aGV0aGVyIGhvc3Qtc2lkZQo+IGhmZW5jZS52dm1hIGlzIGFs
c28gbmVlZGVkLgoKRW5hYmxpbmcgSFNUQVRVUy5WVFZNIGhhcyBhIGJpZyBpbXBhY3Qgb24gcGVy
Zm9ybWFuY2Ugc28gY2VydGFpbmx5Ck5BQ0sgZnJvbSBteXNpZGUuCgo+Cj4gTXkgcXVlc3Rpb25z
IGFyZToKPiAxLiBJcyB0aGUgYmVoYXZpb3IgYWJvdmUgZXhwZWN0ZWQgb24gY3VycmVudCBSSVND
LVYgS1ZNPwoKWWVzLCBpdCBzaG91bGQgd29yayBmaW5lIHVubGVzcyB0aGVyZSBpcyBzb21lIEhX
IGJ1Zy4KCj4gMi4gSWYgbm90LCB3aGF0IHdvdWxkIGJlIHRoZSBwcmVmZXJyZWQgZml4IGRpcmVj
dGlvbj8KPiAzLiBTaG91bGQgdGhpcyBiZSBoYW5kbGVkIGJ5IHRyYXBwaW5nIGd1ZXN0IHNmZW5j
ZS52bWEgd2l0aCBWVFZNLCBieQo+ICAgIGdlbmVyYWxpemluZyB0aGUgZXhpc3RpbmcgdkNQVS1t
aWdyYXRpb24gVlMtc3RhZ2UgVExCIGZsdXNoIGxvZ2ljLCBvciBieQo+ICAgIGFkZGluZyBhIGxp
Z2h0ZXIgU0JJLW1lZGlhdGVkIHBhdGggZm9yIGd1ZXN0IGxvY2FsIHNmZW5jZS52bWE/Cj4gNC4g
T3IgaXMgdGhlcmUgYW5vdGhlciBpbnRlbmRlZCBtZWNoYW5pc20gdG8ga2VlcCBWUy1zdGFnZSBU
TEIgc3RhdGUgY29oZXJlbnQKPiAgICBhY3Jvc3MgdkNQVSBtaWdyYXRpb24/Cj4KPiBJZiBuZWVk
ZWQsIEkgY2FuIHNlbmQgYSByZXByb2R1Y2VyIGFuZCB0aGUgZXhhY3QgaGFyZHdhcmUva2VybmVs
IGRldGFpbHMuCj4KCkV2ZW4gaWYgeW91IHNoYXJlIHNvbWUgcmVwb3JkdWNpbmcgY29kZSBzZXF1
ZW5jZSwgd2Ugc3RpbGwgaGF2ZSBkb24ndApoYXZlIGFjY2VzcyB0byB5b3VyIEhXIHNvIGl0IHdv
bid0IGhlbHAgbXVjaC4KClJlZ2FyZHMsCkFudXAKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0
Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
