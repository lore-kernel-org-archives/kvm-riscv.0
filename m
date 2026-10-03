Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707B6CA5FDD
	for <kvm-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 10:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=05mONx+rH4DmpnTCnMzbc0zL27nom+RVy48pAPPRdAk=; b=s+L/rxdht0g7eN
	4zfcnhGbUl2xdD7goPDeH2DBI/1ocFs4S7RsI0yBrb2QcljdFtjSNlwSYgA6joTOiMmS3IGtx3iCL
	Hay2PkqBvogycqvKxmfSf8nfRTVb9sAoQ3R2Iq+1n1Cxgv7St3Ft4qDvbD/kJU9Wyxr8lSjYuA//H
	uTyHLgdrzyV/E8ijDCvcy4TprMxyN0UbJKn/Sj6K4HMbRjm8xRwbmERUzpZc7VMYPmMhh5gWVfeYg
	UwHxwJexTd/mL/TIn/0vdw4++BeJlqIb+Vw5FeHW85PVqWbo/n3Nbbpgf+8wtG4/Hs6Ft5ZfJstjJ
	NR+Bqsk4CiIF27b1A8cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwZ5-0000000DKg1-21OE;
	Sat, 03 Oct 2026 10:01:59 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwZ3-0000000DKf9-0ljw
	for kvm-riscv@lists.infradead.org;
	Sat, 03 Oct 2026 10:01:58 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so3469545e9.1
        for <kvm-riscv@lists.infradead.org>; Sat, 03 Oct 2026 03:01:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791021715; cv=none;
        d=google.com; s=arc-20260327;
        b=lNi8rFTPvswcW+tTIckzPrl3SKdYMPMGdlLomJUl24mI+fN33XYSf8HX4ZJRsdqeEK
         gFR8yZs0vvi1w0diiMQaRLVET2aopys5xjEFWa9jDsaaOvg6KBguoCQRVfnECMLNBxZI
         soorzIwVAHZrHbAYpmCR1fTW56LYAWyr9PdauWLshihvg2R3BxRkkT3i/wnIbTzvh2pC
         uJCq2U/p3O1EAmu7ZPJ9kPR1IYht0Va7/DMVIfL5ZsCk77lhUPMRcXX7BLjveDwSmn0n
         H82pZ5GSceZWRsuqGHtBRQW9UeYzVdwbZcaXJshkkbRfp1oJF7Cz8XAky9RjFSSQmovD
         yhPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ODhu0+JORxMVydzwdRHX9v6bx/g/rjNmTXIxiRRhk70=;
        fh=gRKYZwCXoDfRZmvXJ3AugiFQHwFNWoIZXDJiNCUur2E=;
        b=DJyeL7fL9BUgID2j1LIcvoqdl3Qjn8kS63dm4Btu2XtQb+Swa8G0Y/+Lie2yVws6uu
         wXRT+E9r8AE1VvXLFm8m4IfaWdCNTrRgsT9Ttjg0XEWRR2+KvuF2DgYgsx6yL6fXn4ue
         FVk+ZSSJ2lbGH2DgyinfH0VXF4i7ig5RlfHkSHG5kjOy+NRfk6HWzyW4U5MwKX3kQyHR
         6Ul/batenfzyAeoElKCH//heq9mzhaaBOCu3lZDv3I3p4FwzqSHUGHqS3PretuAv5v0g
         LR01ewb9ebdtlPmg1jpQmElHAXfjbUFzHac+tu2KgRfvshJf7SQL7tgphLzewzj+0mA1
         edVw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791021715; x=1791626515; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ODhu0+JORxMVydzwdRHX9v6bx/g/rjNmTXIxiRRhk70=;
        b=tcESZpj7OecNEf9PuS9ct2qQeciZzmq6dN95kvDa9rW4FXVEqlCmIRh4piucEm9XVW
         974RWc3ag7KkI5a83vQpUIF8R1b5HvZhHNctU5zXOzzIovog/D76dkQwXHJSyQ0k380c
         LJ/p9CUbBDy6plJd81IZenqUT8MnP226jBvGV5ZHnql0AplsDCvqPindlazi4PRWoqaC
         0KeubIsB+FwOxYPPTKYYTWpu+0Ulr61OVnZe0H/7hKY3/DN6ivoN0Bows7/35wgqCUL9
         oe13eFuwFVeRxfuASaqkKDeUWCFBGXGPTQzoGPTYgO8DQdnuHew71kpNLCvXzMgzEvXO
         /E4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791021715; x=1791626515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ODhu0+JORxMVydzwdRHX9v6bx/g/rjNmTXIxiRRhk70=;
        b=mDmvM2Y4q/AcBhPPuoitGg+yMf6ek9uskJIs9rInKxrH+U44kFJTtIdZGTKjcsM8/M
         kmGc3cqyNB25eDBS8g4hmFubCcCJOUichfZq2b2+AfYqamH7s49sYwDhMKj5G1FYHS1o
         DySEkcGmNJWxxyPNOuPY+DhthpwAEbmdth5AvKm9mE/WdoQzSj3xW7dcqlMYHAigVtio
         H92jq4B7CSqr7Py+VIwQ8VxkF8gUnMnOYdh+ypsn4Mjv5TjVEhd7f2HvxBDR8eK8NZ25
         SAFwnAxiwhSAC1+PAdAo0Sf+15EetIqDNmPbFciUTJxFmcLJeM6Ec07bIjgAxy0i2Zxn
         eIeg==
X-Forwarded-Encrypted: i=1; AKwUvBxaaFhQCf7V9h4MyqlcyECKMGTt3fUB67tEU4LOockMCBAXylTpOsJCvx2Nk0MIj5JsXd77WP/RL9k=@lists.infradead.org
X-Gm-Message-State: AFuF++lCidHBFgUFztqE0NZdRO/g7OnBVfFZZMnC+Y1Kgqb9/ltmP70B
	ZCdQSI7RiOI2rF+cgNPeVzwroFC3cHhqx0f7aqpeuoviYJkg7JdUMXxZEL6WZ+oMYsMj1xtqpTY
	jla2gQHoDqJtXC87SbFwmYN6NwiBAmoD9+QBbXy6bjQ==
X-Gm-Gg: AYBFou1+R5/haLbblkkweMOFqdHFLHrOhDT2B3xkjWwMCYLE23iK3i/WUYIafa6VXrt
	GBKnOKn9ow6Jf1gTM/qvcGzPH3NmT5BK09thTO/tjomUSuvBuSaMT7RH96YeyKmLcSig9jKLilL
	CVg5p6+zoyg6HLB2mEFA+B4vz1WJFeL+wAswL5j1s6yhN79RqhsCGrF2wkM/lxfelWogYwAnz1y
	3GZRbe/JpvS1mTbdW5a2BO7QD0wyB45PK5+tDaplz2MpTsWMvhCO6F0sOkr2Qp+CwF7YTutHyuS
	D/jQAnMlPmPKu/AlEoRUL/iOkOJdyomimFtLd5Tcw0/T02X/vXtu+EBU/AJ8CjrOnumhyMMMC1y
	SBn2CjgR5B2U5HJ7CWs0zMCrWnuyxGVlAqsT3u8yeG/uFwff5OCL9mLYJFqlquj2nDdmdqVNk1+
	U=
X-Received: by 2002:a05:600c:8715:b0:49c:fc6c:be08 with SMTP id
 5b1f17b1804b1-4a0276b1af1mr87172225e9.31.1791021715031; Sat, 03 Oct 2026
 03:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260814114507.583424-1-jinyu.tang@linux.dev> <20260814114507.583424-2-jinyu.tang@linux.dev>
In-Reply-To: <20260814114507.583424-2-jinyu.tang@linux.dev>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 3 Oct 2026 15:31:43 +0530
X-Gm-Features: AclHuK9k6L1OYyDIrVaj_x6CqtWghMYumWURAwB0uofKGuH7qFYD0LqZ2Py3IoI
Message-ID: <CAAhSdy3z3C4nCvuU688Tw+YyioECdE_h=q0pXt7yJadaynn20g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] KVM: riscv: Implement KVM_PRE_FAULT_MEMORY
To: Jinyu Tang <jinyu.tang@linux.dev>
Cc: Anup Patel <apatel@ventanamicro.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Jinyu Tang <tjytimi@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_030157_265395_9BCD0471 
X-CRM114-Status: GOOD (  24.78  )
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

T24gRnJpLCBBdWcgMTQsIDIwMjYgYXQgNToxNeKAr1BNIEppbnl1IFRhbmcgPGppbnl1LnRhbmdA
bGludXguZGV2PiB3cm90ZToKPgo+IFRoZSBnZW5lcmljIEtWTV9QUkVfRkFVTFRfTUVNT1JZIGlv
Y3RsIGxldHMgdXNlcnNwYWNlIHBvcHVsYXRlIEtWTSBwYWdlCj4gdGFibGVzIGJlZm9yZSBydW5u
aW5nIGEgdkNQVSBvdmVyIGEgR1BBIHJhbmdlLiB4ODYgYWxyZWFkeSBzdXBwb3J0cyB0aGUKPiBp
b2N0bCwgYnV0IFJJU0MtViBkb2VzIG5vdCBleHBvc2UgdGhlIGNhcGFiaWxpdHkgYW5kIGhhcyBu
byBhcmNoIGhvb2suCj4KPiBBZGQgdGhlIFJJU0MtViBhcmNoIGhvb2sgYW5kIHJldXNlIHRoZSBl
eGlzdGluZyBHLXN0YWdlIGZhdWx0IG1hcHBpbmcKPiBwYXRoIHdpdGggYSByZWFkIGFjY2Vzcy4g
UmVwb3J0IHByb2dyZXNzIHVzaW5nIHRoZSBHLXN0YWdlIG1hcHBpbmcKPiByZXR1cm5lZCBieSB0
aGUgbWFwIHBhdGgsIHNvIHRoZSBpb2N0bCBjYW4gYWR2YW5jZSBieSB0aGUgYWN0dWFsIGxlYWYK
PiBzaXplIHRoYXQgY292ZXJzIHRoZSByZXF1ZXN0ZWQgR1BBLiBSZXRyeSB1bnRpbCBhIG1hcHBp
bmcgaXMgaW5zdGFsbGVkCj4gb3IgYSBzaWduYWwsIFZNLWRlYWQgcmVxdWVzdCwgb3IgcmVhbCBl
cnJvciBpcyBvYnNlcnZlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEppbnl1IFRhbmcgPGppbnl1LnRh
bmdAbGludXguZGV2Pgo+IC0tLQo+IHYyIC0+IHYzOgo+IC0gUmV0cnkgaW50ZXJuYWxseSB3aGVu
IHRoZSBtYXAgcGF0aCByZXR1cm5zIHN1Y2Nlc3Mgd2l0aG91dCBhIHZpc2libGUKPiAgIEctc3Rh
Z2UgbWFwcGluZywgaW5zdGVhZCBvZiBleHBvc2luZyAtRUFHQUlOLiAgKFNhc2hpa28pCj4KPiAg
YXJjaC9yaXNjdi9rdm0vS2NvbmZpZyAgfCAgMSArCj4gIGFyY2gvcmlzY3Yva3ZtL2dzdGFnZS5j
IHwgIDMgKysrCj4gIGFyY2gvcmlzY3Yva3ZtL21tdS5jICAgIHwgNDIgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9rdm0vdm0uYyAgICAgfCAg
MSArCj4gIDQgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva3ZtL0tjb25maWcgYi9hcmNoL3Jpc2N2L2t2bS9LY29uZmlnCj4gaW5kZXgg
ZWMyY2VlMGEzOWUwLi44YWMyMDllOGFjODcgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0v
S2NvbmZpZwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL0tjb25maWcKPiBAQCAtMjgsNiArMjgsNyBA
QCBjb25maWcgS1ZNCj4gICAgICAgICBzZWxlY3QgS1ZNX0NPTU1PTgo+ICAgICAgICAgc2VsZWN0
IEtWTV9HRU5FUklDX0RJUlRZTE9HX1JFQURfUFJPVEVDVAo+ICAgICAgICAgc2VsZWN0IEtWTV9H
RU5FUklDX0hBUkRXQVJFX0VOQUJMSU5HCj4gKyAgICAgICBzZWxlY3QgS1ZNX0dFTkVSSUNfUFJF
X0ZBVUxUX01FTU9SWQo+ICAgICAgICAgc2VsZWN0IEtWTV9NTUlPCj4gICAgICAgICBzZWxlY3Qg
VklSVF9YRkVSX1RPX0dVRVNUX1dPUksKPiAgICAgICAgIHNlbGVjdCBTQ0hFRF9JTkZPCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jIGIvYXJjaC9yaXNjdi9rdm0vZ3N0YWdl
LmMKPiBpbmRleCBlNTAwMmNiOWNiZWYuLjZiZDhiOGZkNmNlYiAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L2t2bS9nc3RhZ2UuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jCj4gQEAg
LTI4MCw2ICsyODAsOSBAQCBpbnQga3ZtX3Jpc2N2X2dzdGFnZV9tYXBfcGFnZShzdHJ1Y3Qga3Zt
X2dzdGFnZSAqZ3N0YWdlLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBvdXRfbWFwLT5sZXZlbCwgdHJ1ZSk7Cj4gICAgICAgICAgICAgICAgIH0g
ZWxzZSBpZiAoQUxJR05fRE9XTihQRk5fUEhZUyhwdGVfcGZuKHB0ZXBfZ2V0KHB0ZXApKSksIHBh
Z2Vfc2l6ZSkgPT0gaHBhKSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X2dz
dGFnZV91cGRhdGVfcHRlX3Byb3QoZ3N0YWdlLCBwdGVwX2xldmVsLCBncGEsIHB0ZXAsIHByb3Qp
Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIG91dF9tYXAtPmFkZHIgPSBBTElHTl9ET1dOKGdw
YSwgcGFnZV9zaXplKTsKClRoaXMgQUxJR05fRE9XTigpIG11c3QgYmUgZG9uZSBmb3IgYWxsIGNh
c2VzIGF0IHRoZSBzdGFydCBpdHNlbGYKcmlnaHQgYWZ0ZXIgZ3N0YWdlX3BhZ2Vfc2l6ZV90b19s
ZXZlbCgpLiBJIHdpbGwgdGFrZSBjYXJlIG9mIHRoaXMgYXQgdGhlCnRpbWUgb2YgbWVyZ2luZyB0
aGlzIHBhdGNoLgoKPiArICAgICAgICAgICAgICAgICAgICAgICBvdXRfbWFwLT5sZXZlbCA9IHB0
ZXBfbGV2ZWw7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgb3V0X21hcC0+cHRlID0gcHRlcF9n
ZXQocHRlcCk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gICAgICAgICAg
ICAgICAgIH0KPiAgICAgICAgIH0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vbW11LmMg
Yi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+IGluZGV4IDYwMzViNWVjOTUwMy4uMzNkNGJhNDA2YjBk
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9r
dm0vbW11LmMKPiBAQCAtNzQ4LDYgKzc0OCw0OCBAQCBpbnQga3ZtX3Jpc2N2X21tdV9tYXAoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICptZW1zbG90LAo+ICAg
ICAgICAgcmV0dXJuIHJldDsKPiAgfQo+Cj4gK2xvbmcga3ZtX2FyY2hfdmNwdV9wcmVfZmF1bHRf
bWVtb3J5KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3Qga3ZtX3ByZV9mYXVsdF9tZW1vcnkgKnJhbmdlKQo+ICt7Cj4gKyAg
ICAgICBzdHJ1Y3Qga3ZtX2dzdGFnZV9tYXBwaW5nIG91dF9tYXAgPSB7IDAgfTsKPiArICAgICAg
IHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKm1lbXNsb3Q7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25n
IG1hcF9zaXplOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBodmE7Cj4gKyAgICAgICBncGFfdCBl
bmQ7Cj4gKyAgICAgICBnZm5fdCBnZm47Cj4gKyAgICAgICBpbnQgcmV0Owo+ICsKPiArICAgICAg
IGdmbiA9IGdwYV90b19nZm4ocmFuZ2UtPmdwYSk7Cj4gKyAgICAgICBtZW1zbG90ID0ga3ZtX3Zj
cHVfZ2ZuX3RvX21lbXNsb3QodmNwdSwgZ2ZuKTsKPiArICAgICAgIGlmICghbWVtc2xvdCkKPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9FTlQ7Cj4gKwo+ICsgICAgICAgaHZhID0gZ2ZuX3Rv
X2h2YV9tZW1zbG90X3Byb3QobWVtc2xvdCwgZ2ZuLCBOVUxMKTsKPiArICAgICAgIGlmIChrdm1f
aXNfZXJyb3JfaHZhKGh2YSkpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRU5PRU5UOwo+ICsK
PiArICAgICAgIGZvciAoOzspIHsKPiArICAgICAgICAgICAgICAgaWYgKHNpZ25hbF9wZW5kaW5n
KGN1cnJlbnQpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVFI7Cj4gKwo+
ICsgICAgICAgICAgICAgICBpZiAoa3ZtX2NoZWNrX3JlcXVlc3QoS1ZNX1JFUV9WTV9ERUFELCB2
Y3B1KSkKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTzsKClRoZSBrdm1fY2hl
Y2tfcmVxdWVzdCgpIGRvZXMgbm90IGFsbG93IEtWTV9SRVFfVk1fREVBRCBiZWNhdXNlCnRoaXMg
cmVxdWVzdCBjYW4ndCBiZSBjbGVhcmVkIHNvIHdlIGhhdmUgdG8gdXNlIGt2bV90ZXN0X3JlcXVl
c3QoKSBvdmVyCmhlcmUuIEkgd2lsbCB1cGRhdGUgaXQgYXQgdGhlIHRpbWUgb2YgbWVyZ2luZyB0
aGlzIHBhdGNoLgoKPiArCj4gKyAgICAgICAgICAgICAgIGNvbmRfcmVzY2hlZCgpOwo+ICsgICAg
ICAgICAgICAgICByZXQgPSBrdm1fcmlzY3ZfbW11X21hcCh2Y3B1LCBtZW1zbG90LCByYW5nZS0+
Z3BhLCBodmEsIGZhbHNlLCAmb3V0X21hcCk7Cj4gKyAgICAgICAgICAgICAgIGlmIChyZXQpCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiArCj4gKyAgICAgICAgICAgICAg
IGlmIChwdGVfdmFsKG91dF9tYXAucHRlKSkKPiArICAgICAgICAgICAgICAgICAgICAgICBicmVh
azsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICBtYXBfc2l6ZSA9IFBBR0VfU0laRSA8PCAob3V0
X21hcC5sZXZlbCAqIGt2bV9yaXNjdl9nc3RhZ2VfaW5kZXhfYml0cyk7Cj4gKyAgICAgICBlbmQg
PSBBTElHTl9ET1dOKHJhbmdlLT5ncGEsIG1hcF9zaXplKSArIG1hcF9zaXplOwo+ICsKPiArICAg
ICAgIHJldHVybiBtaW5fdCh1NjQsIHJhbmdlLT5zaXplLCBlbmQgLSByYW5nZS0+Z3BhKTsKPiAr
fQo+ICsKPiAgaW50IGt2bV9yaXNjdl9tbXVfYWxsb2NfcGdkKHN0cnVjdCBrdm0gKmt2bSkKPiAg
ewo+ICAgICAgICAgc3RydWN0IHBhZ2UgKnBnZF9wYWdlOwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2t2bS92bS5jIGIvYXJjaC9yaXNjdi9rdm0vdm0uYwo+IGluZGV4IGE5ZjA4M2ZlZWI3Ni4u
NTg1MDBhMTliMzNiIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZtLmMKPiArKysgYi9h
cmNoL3Jpc2N2L2t2bS92bS5jCj4gQEAgLTE4Nyw2ICsxODcsNyBAQCBpbnQga3ZtX3ZtX2lvY3Rs
X2NoZWNrX2V4dGVuc2lvbihzdHJ1Y3Qga3ZtICprdm0sIGxvbmcgZXh0KQo+ICAgICAgICAgY2Fz
ZSBLVk1fQ0FQX01QX1NUQVRFOgo+ICAgICAgICAgY2FzZSBLVk1fQ0FQX0lNTUVESUFURV9FWElU
Ogo+ICAgICAgICAgY2FzZSBLVk1fQ0FQX1NFVF9HVUVTVF9ERUJVRzoKPiArICAgICAgIGNhc2Ug
S1ZNX0NBUF9QUkVfRkFVTFRfTUVNT1JZOgo+ICAgICAgICAgICAgICAgICByID0gMTsKPiAgICAg
ICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICBjYXNlIEtWTV9DQVBfTlJfVkNQVVM6Cj4gLS0K
PiAyLjQzLjAKCk90aGVyd2lzZSwgaXQgbG9va3MgZ29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBB
bnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0Y2ggZm9yIExp
bnV4LTcuNAoKVGhhbmtzLApBbnVwCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2t2bS1yaXNjdgo=
