Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861C6CA5FE4
	for <kvm-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 21:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pVybvgtmn86KOFEaztZPvBZWWgL3l0sV4Sxp0vZi5RE=; b=pWvoXwMPuwq+sw
	newr7LhdPEzWA739Heqm/e+9sxBmcUaOs0wfQcpnmD31KBuJPR5dHcR7C8ZwRxrxNYGl0Q5oiRThj
	9B2SEkfNYMvEjybtrGnMTocMjl5RspzSh3yQcQtXEhqava+/Ilo9k6ZPnq6lR9E5mA28zXAlqGcfn
	N0Qk1k9PFDvfE5x2LPdc6xzJHG9VYL24/PW+P3dYOxrvI/yDFtzg3Avg2xSFalCgaiu+e3ohQJXJs
	12MA8VGff/HkEgM53SRu1wHn7SlDd0ZL3etfaDhsaVrbTOI0SR4q7FPIkmqQWxzkugisI+P75Yn4t
	CkFAfzRj1NQmfOGD3LbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD7M5-0000000E4wY-3np6;
	Sat, 03 Oct 2026 21:33:17 +0000
Received: from mail-wr2-x0d.google.com ([2a00:1450:4864:30::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD7M3-0000000E4vm-1ATc
	for kvm-riscv@lists.infradead.org;
	Sat, 03 Oct 2026 21:33:16 +0000
Received: by mail-wr2-x0d.google.com with SMTP id ffacd0b85a97d-48b104f6aa3so271998f8f.0
        for <kvm-riscv@lists.infradead.org>; Sat, 03 Oct 2026 14:33:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791063193; cv=none;
        d=google.com; s=arc-20260327;
        b=PXbRmj8LVukQC/Sa8ttIkvYgUZ21NJgDMxWmVdIbf2xxN8RqpLO7w7ruZDVJKartue
         WxBFCvlchVHk7rcz++dfXnOVFmLNIoNO7ny2hdZQSY0eZnUqtDa+FC+Edg5l2Yckcthg
         Xgiu0s6FtoX8yiKhTcKLLLXWYuAYH5Z09EtkeH6s6XkCBx8sHVVamlDc54sjEGpyDne6
         eenTb+bDH51VUuULGXdAdG/OJXlvFbPfe8H13cVSVLp0+RZ5Gk5KAdbdFTNpWWzAdSeS
         TZhIphscbDU1gCrXIiZLvQhKIpiATrCG2KIVm3kSVoVhI560d1kQemxq/cXgAFLkgBnc
         uCPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qfZvs7JHnwLbB5TOb4/EZHNkBzF/EHZB9b3YDWrj+qc=;
        fh=0OZddMaI6AEIhSjNs2yxoR0n1IclL1o4TIkFCFUCmwo=;
        b=KQI0qXQjmCaf4oM23nbMIS0jzr4L5v8cwinom1xvn9kQwAUIDlpIaLJKjg32Sm06M3
         FXON+2ZNhlMvdodGN3hQ06nPY5vkUP7PVnRIdjG3g9Rezgp9vrStlzATunVXw/pi+JQS
         JRyDYQFkSaO9Xo7XvtPea7LRv/wIyXYRcICQYQlrFjDxvH/wOcNf36tiUcAc3+Erar/w
         05uU0X8QwYCr4D7GuAy5X+KcMxawWbCEdMSg6g9mJ5KGmxhJ0yYoaceYuRGS8FbqdySP
         2igyiFboAJDWPF/Wt2Nq6gEyD66ukGC0VT/uCxftRSYeyRtcKpv2geBtjGFeoCSA8Cr9
         CYWg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791063193; x=1791667993; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qfZvs7JHnwLbB5TOb4/EZHNkBzF/EHZB9b3YDWrj+qc=;
        b=K0bMj/Za18C7bfWrYo6ZF9Z2xAt3fZpKHSdP8UdYLHTsgCknzKUbet7bkBqJ5rVgdF
         5AgBeluXbgTOeeDQqHVpnSWfZKQGBkt2zq3AEpVb8ZJfmb6YynLSDp23xsjiv+BlUvTo
         mAPjCRU2UZ0Hv/We+XjZN7TrltDakxQSu/e1MkI5ZpWFFzlFKH3i1QmYhjXfG029UWnw
         wFZspDZNWE87W13O+AVLsJxkA4oJSP026wmhcKPK7yakO5jB6gL0RMqhUr9gCdtRnyDp
         rtD6nzIe+OQUUAaOTVgAByZqqPo9f47P0turHIWfafifS6JowQ1nwEegq2pFpLlrap5E
         IwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791063193; x=1791667993;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qfZvs7JHnwLbB5TOb4/EZHNkBzF/EHZB9b3YDWrj+qc=;
        b=Kpm1pYKmKhCgpdWVROv4eXUd670Xa1N6gL7QuYtUU0Oi3LP/K/UTBpuH7b3M4qMUn7
         pbrEEVdNu1S7O6LDGsvQ/JXaIE7CjpndlC4wR+5UJaYGDbSbwfgPmdkhuCauFpZuwiqr
         7Ke5q4uHXql0EtiA9DNemzRTTk82otIEcUpeVOgCQJ3kriZDQrjmK42Lc4/4EzyWqezc
         yowJ34okFabT3CFxnFDeoWRi7IUChgXP55/9ielFar891+ggCSYimjm3lgKlRNvUY5gQ
         kjmXejonHLUyP6QveFxoIDaEwPtbaPEqOjp1tJA1uaUDhTgvt+MNCIiQ74vOpxsQFq5Q
         fOWw==
X-Forwarded-Encrypted: i=1; AKwUvBxHBVi2N/rA/uj+tgExAzxTZzEJdxglJdI7rw9ZP+PWVI+tdY1pHxRMfczjt+rnLr/RTK56ypv/SvA=@lists.infradead.org
X-Gm-Message-State: AFq9FYI5qrOL4qo/MxiGWmPqZs9Z2bYalTomLA+QOdnGaU5bn7nbz0cY
	Bq+w1zUV1zuh1mOy8xNtBCFPHQG3xZ0haAU4bJFhWhovBp8tn/GrMISpBn00cpISOAbxn7ziVug
	58W6tqU8rab+/0dL4whcBwAjyl+Z1/2b0tQp/teSpaQ==
X-Gm-Gg: AYBFou1tMuoc5xp8nfIdilPnooEgJPGwoxDuk4MwQL2FDubvcu8/B/KZe1iygK6LkPE
	HBdX0ntJOs7ITDEUIsC472PM+F2f3nLAyw7LVwnAQ4c6ZzuiwggbDYBkK++gqbA6dvT5vs32QxA
	tWo5Qb8jW+Sw85poKxioMskiE94I1Cx7597HDiM+g1IaKGdfvK3VwOxQ6nm8STs5dF+n9+I+QHW
	VDTPePZqJfld94aJ9NS785/gTMJKf/afd6q2KLcqa4YYuy4cmiFEb6gbZnz5bqcRYqbHZ+ePSlF
	4hBtr7FOvDHPkZ07/n/nDuCKkXOLf22zDt10IcvJV2LdmkgQXmSYuIw76ujS2xc3QkssItz64Eq
	oXPwuwV7slZBfOWGOzKqIvX54KHRYnUEjYmywLD9lOh6HOe3PMfJlW7lsu53GLn+Kw31yc3SYLJ
	7cR7Xxg5Wv
X-Received: by 2002:a05:6000:2008:b0:48c:557d:ab24 with SMTP id
 ffacd0b85a97d-48c557daf9fmr296756f8f.4.1791063192798; Sat, 03 Oct 2026
 14:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260815102833.864330-1-jinyu.tang@linux.dev> <20260815103123.864738-1-jinyu.tang@linux.dev>
In-Reply-To: <20260815103123.864738-1-jinyu.tang@linux.dev>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 4 Oct 2026 03:00:50 +0530
X-Gm-Features: AclHuK_HLZyYPpTxHZ72T9yKE8JtgWcR285DcDxiQ-zUi9vakSvTlMiSylojJss
Message-ID: <CAAhSdy01fWGXx37Nq1LsVWajoH8B_O=hvU0b4vw5AsnOQm054w@mail.gmail.com>
Subject: Re: [PATCH v4 RESEND 1/5] KVM: riscv: Avoid overwriting G-stage
 tables with huge leaves
To: Jinyu Tang <jinyu.tang@linux.dev>
Cc: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
	Nutty Liu <nutty.liu@hotmail.com>, Jinyu Tang <tjytimi@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_143315_361429_D99F874F 
X-CRM114-Status: GOOD (  21.80  )
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

T24gU2F0LCBBdWcgMTUsIDIwMjYgYXQgNDowMeKAr1BNIEppbnl1IFRhbmcgPGppbnl1LnRhbmdA
bGludXguZGV2PiB3cm90ZToKPgo+IFJJU0MtViBLVk0gY2FuIG92ZXJ3cml0ZSBhbiBleGlzdGlu
ZyBHLXN0YWdlIHRhYmxlIGVudHJ5IHdoZW4KPiBpbnN0YWxsaW5nIGEgaHVnZSBsZWFmIG1hcHBp
bmcuIElmIHRoZSB0YXJnZXQgaHVnZSByYW5nZSBhbHJlYWR5IGhhcyBhCj4gbG93ZXItbGV2ZWwg
cGFnZSB0YWJsZSwga3ZtX3Jpc2N2X2dzdGFnZV9zZXRfcHRlKCkgY2FuIHJlcGxhY2UgdGhlCj4g
bm9uLWxlYWYgZW50cnkgd2l0aCBhIGxlYWYgUFRFIGFuZCBkaXNjb25uZWN0IHRoZSBsb3dlci1s
ZXZlbCBwYWdlCj4gdGFibGUuCj4KPiBSZWplY3QgcmVwbGFjaW5nIGEgdmFsaWQgdGFibGUgZW50
cnkgd2l0aCBhIGxlYWYgUFRFLiBJZiBodWdlLXBhZ2UKPiBpbnN0YWxsYXRpb24gaGl0cyBzdWNo
IGEgY29uZmxpY3QsIGZhbGwgYmFjayB0byBhIDRLIG1hcHBpbmcgZm9yIHRoZQo+IG9yaWdpbmFs
IGZhdWx0aW5nIEdQQSBpbiB0aGUgTU1VIGZhdWx0IHBhdGgsIHdoZXJlIHRoZSBvcmlnaW5hbCBH
UEEgYW5kCj4gSEZOIGFyZSBzdGlsbCBhdmFpbGFibGUuCj4KPiBTdWdnZXN0ZWQtYnk6IFNhc2hp
a28gPHNhc2hpa28tYm90QGtlcm5lbC5vcmc+Cj4gRml4ZXM6IDlkMDVjMWZlZTgzNyAoIlJJU0Mt
VjogS1ZNOiBJbXBsZW1lbnQgc3RhZ2UyIHBhZ2UgdGFibGUgcHJvZ3JhbW1pbmciKQo+IFNpZ25l
ZC1vZmYtYnk6IEppbnl1IFRhbmcgPGppbnl1LnRhbmdAbGludXguZGV2Pgo+IC0tLQo+ICBhcmNo
L3Jpc2N2L2t2bS9nc3RhZ2UuYyB8ICA2ICsrKysrKwo+ICBhcmNoL3Jpc2N2L2t2bS9tbXUuYyAg
ICB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDI5IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2
bS9nc3RhZ2UuYyBiL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jCj4gaW5kZXggZTUwMDJjYjljYmVm
Li41NGQ0NWFkZGYxOGYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vZ3N0YWdlLmMKPiAr
KysgYi9hcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYwo+IEBAIC0xNzQsNiArMTc0LDEyIEBAIGludCBr
dm1fcmlzY3ZfZ3N0YWdlX3NldF9wdGUoc3RydWN0IGt2bV9nc3RhZ2UgKmdzdGFnZSwKPgo+ICAg
ICAgICAgaWYgKHB0ZV92YWwoKnB0ZXApICE9IHB0ZV92YWwobWFwLT5wdGUpKSB7Cj4gICAgICAg
ICAgICAgICAgIGJvb2wgd2FzX2ludmFsaWQgPSAhcHRlX3ZhbCgqcHRlcCk7Cj4gKwo+ICsgICAg
ICAgICAgICAgICAvKiBBdm9pZCByZXBsYWNpbmcgYW4gZXhpc3RpbmcgbG93ZXItbGV2ZWwgdGFi
bGUgd2l0aCBhIGxlYWYgbWFwcGluZy4gKi8KPiArICAgICAgICAgICAgICAgaWYgKCFnc3RhZ2Vf
cHRlX2xlYWYocHRlcCkgJiYgIXdhc19pbnZhbGlkICYmCj4gKyAgICAgICAgICAgICAgICAgICBn
c3RhZ2VfcHRlX2xlYWYoJm1hcC0+cHRlKSkKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1
cm4gLUVFWElTVDsKPiArCj4gICAgICAgICAgICAgICAgIHNldF9wdGUocHRlcCwgbWFwLT5wdGUp
Owo+ICAgICAgICAgICAgICAgICBpZiAoZ3N0YWdlX3B0ZV9sZWFmKHB0ZXApICYmCj4gICAgICAg
ICAgICAgICAgICAgICAhKHdhc19pbnZhbGlkICYmIHJpc2N2X2hhc19leHRlbnNpb25fdW5saWtl
bHkoUklTQ1ZfSVNBX0VYVF9TVlZQVEMpKSkKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0v
bW11LmMgYi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+IGluZGV4IDYwMzViNWVjOTUwMy4uYmZkNjE2
OGViZTMwIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gKysrIGIvYXJjaC9y
aXNjdi9rdm0vbW11LmMKPiBAQCAtNjI1LDEwICs2MjUsMTEgQEAgaW50IGt2bV9yaXNjdl9tbXVf
bWFwKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqbWVtc2xv
dCwKPiAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGt2bV9nc3RhZ2VfbWFwcGluZyAqb3V0
X21hcCkKPiAgewo+ICAgICAgICAgaW50IHJldDsKPiAtICAgICAgIGt2bV9wZm5fdCBoZm47Cj4g
KyAgICAgICBrdm1fcGZuX3QgZmF1bHRfaGZuLCBoZm47Cj4gICAgICAgICBib29sIGlzX2h1Z2V0
bGI7Cj4gICAgICAgICBib29sIHdyaXRhYmxlOwo+ICAgICAgICAgdW5zaWduZWQgaW50IHZtYV9w
YWdlc2hpZnQ7Cj4gKyAgICAgICBncGFfdCBmYXVsdF9ncGEgPSBncGE7Cj4gICAgICAgICBnZm5f
dCBnZm4gPSBncGEgPj4gUEFHRV9TSElGVDsKPiAgICAgICAgIHN0cnVjdCB2bV9hcmVhX3N0cnVj
dCAqdm1hOwo+ICAgICAgICAgc3RydWN0IGt2bSAqa3ZtID0gdmNwdS0+a3ZtOwo+IEBAIC03MDks
NiArNzEwLDcgQEAgaW50IGt2bV9yaXNjdl9tbXVfbWFwKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwg
c3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqbWVtc2xvdCwKPiAgICAgICAgIH0KPiAgICAgICAgIGlm
IChpc19lcnJvcl9ub3Nsb3RfcGZuKGhmbikpCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUZB
VUxUOwo+ICsgICAgICAgZmF1bHRfaGZuID0gaGZuICsgKChmYXVsdF9ncGEgPj4gUEFHRV9TSElG
VCkgLSBnZm4pOwo+Cj4gICAgICAgICAvKgo+ICAgICAgICAgICogSWYgbG9nZ2luZyBpcyBhY3Rp
dmUgdGhlbiB3ZSBhbGxvdyB3cml0YWJsZSBwYWdlcyBvbmx5Cj4gQEAgLTczNCw5ICs3MzYsMjkg
QEAgaW50IGt2bV9yaXNjdl9tbXVfbWFwKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2
bV9tZW1vcnlfc2xvdCAqbWVtc2xvdCwKPiAgICAgICAgICAgICAgICAgbWFya19wYWdlX2RpcnR5
X2luX3Nsb3Qoa3ZtLCBtZW1zbG90LCBnZm4pOwo+ICAgICAgICAgICAgICAgICByZXQgPSBrdm1f
cmlzY3ZfZ3N0YWdlX21hcF9wYWdlKCZnc3RhZ2UsIHBjYWNoZSwgZ3BhLCBoZm4gPDwgUEFHRV9T
SElGVCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2
bWFfcGFnZXNpemUsIGZhbHNlLCB0cnVlLCBvdXRfbWFwKTsKPiArICAgICAgICAgICAgICAgaWYg
KHJldCA9PSAtRUVYSVNUKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgLyoKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgKiBSZXRyeSBhdCA0SyBncmFudWxhcml0eSBmb3IgdGhlIG9yaWdp
bmFsIGZhdWx0aW5nIEdQQQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAqIHdoZW4gYSBodWdl
IGxlYWYgY2Fubm90IHJlcGxhY2UgYW4gZXhpc3RpbmcgdGFibGUuCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICovCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0ga3ZtX3Jpc2N2X2dz
dGFnZV9tYXBfcGFnZSgmZ3N0YWdlLCBwY2FjaGUsIGZhdWx0X2dwYSwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhdWx0X2hmbiA8PCBQ
QUdFX1NISUZULAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgUEFHRV9TSVpFLCBmYWxzZSwgdHJ1ZSwKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG91dF9tYXApOwo+ICsgICAgICAg
ICAgICAgICB9CgpJZiB5b3Ugd2VyZSBhdHRlbXB0aW5nIHRvIG1hcCAxRyBodWdlcGFnZSB0aGVu
IHlvdSBzaG91bGQgZmlyc3QgdHJ5CjJNIGFuZCBub3QgNEsuIFRoaXMgcGF0Y2ggbmVlZHMgbW9y
ZSB3b3JrLgoKPiAgICAgICAgIH0gZWxzZSB7Cj4gICAgICAgICAgICAgICAgIHJldCA9IGt2bV9y
aXNjdl9nc3RhZ2VfbWFwX3BhZ2UoJmdzdGFnZSwgcGNhY2hlLCBncGEsIGhmbiA8PCBQQUdFX1NI
SUZULAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZt
YV9wYWdlc2l6ZSwgdHJ1ZSwgdHJ1ZSwgb3V0X21hcCk7Cj4gKyAgICAgICAgICAgICAgIGlmIChy
ZXQgPT0gLUVFWElTVCkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIC8qCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICogUmV0cnkgYXQgNEsgZ3JhbnVsYXJpdHkgZm9yIHRoZSBvcmlnaW5h
bCBmYXVsdGluZyBHUEEKPiArICAgICAgICAgICAgICAgICAgICAgICAgKiB3aGVuIGEgaHVnZSBs
ZWFmIGNhbm5vdCByZXBsYWNlIGFuIGV4aXN0aW5nIHRhYmxlLgo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAqLwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IGt2bV9yaXNjdl9nc3Rh
Z2VfbWFwX3BhZ2UoJmdzdGFnZSwgcGNhY2hlLCBmYXVsdF9ncGEsCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYXVsdF9oZm4gPDwgUEFH
RV9TSElGVCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFBBR0VfU0laRSwgdHJ1ZSwgdHJ1ZSwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG91dF9tYXApOwo+ICsgICAgICAgICAg
ICAgICB9Cj4gICAgICAgICB9Cj4KPiAgICAgICAgIGlmIChyZXQpCj4gLS0KPiAyLjQzLjAKPgoK
UmVnYXJkcywKQW51cAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9rdm0tcmlzY3YK
