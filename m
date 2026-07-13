Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8942C43458
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 12:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cm+i1cUYOGDtEVUlYXnHTgkewK6qX4omOb1BIsdPUxY=; b=ba/3KgcEOsMZXF
	21esPPKuLYnwne6XqYcDLEwvEh1Zc/p0aoT2jIwHILgKXKZZeFNpA3zBKNQJyrSJO3EuLbMzk10qc
	w+S9NoW4QtJl3Fv7d7MxO+JgS6Ww/mrZF+suKBHLT8IbekxrvaB7VSUicVUOOMVh664AYEPEovEww
	NcY50VESVGrKhrPo/FDpHDdLh7IBR2V8cXyUkB6ByOMR4YFZSLjYtlxEM1H7qHJtvAWF8Gye+H3nF
	XWlPkLgR+geWjCBSLP2ysJZTS7Znndm4CRniyQNDyZIVRhD/ga7TXy3/JNaHvPkpS0Mov1xr+jpNq
	Kj6KvFXwhceHJJfFwFng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGEV-00000009GaK-2fMP;
	Mon, 13 Jul 2026 12:58:03 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGES-00000009GYi-0HwK
	for kvm-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 12:58:01 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-493bfe9f886so16436745e9.0
        for <kvm-riscv@lists.infradead.org>; Mon, 13 Jul 2026 05:57:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783947478; cv=none;
        d=google.com; s=arc-20260327;
        b=UfVB8nQ5UGZsCbTpgDhDW4lhrGC4MYWVNhTUp/KIX523XCPx74xXBVNYGm3O26rQLB
         6RyJXFiLo5SzK9bsuvnOd7h2+kJeen6E0L9+LZxpIxasADyuBbjXlvcUItKIqlzdzmPr
         4wcu461YS8cj8kgahldMouWELqvG0wE+dzNjUthngMfKUOA2nc+nADqvMKZfiwBVF6gV
         yKgw5JMowbzHEwHRDE8IwVPhL3NuDVl4yG7wBYLwAZ0AKt83+uclQuue33LthGnqZ9sm
         vN87Fb2/pdeSTkkOL7ixNSdBh0WBic+Yf0WGD1Njqq/UU2tWWYOyKVq3+PVZYJrW+TG5
         OCAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tXeqG3zuIObLsUUPmSnJNLKn59cdNhsnjYph6ZlnxA4=;
        fh=eupJLbG5BiAk94F9QEcDFXAdAbgvGXdUGVRKvo9mLkw=;
        b=HaGtw6Y51RDD3j0eF19k4q1zpjgDg9kklSKlZy9BSLMagDVkhjtAKBuPhfDCo/uSEK
         87fiH4fdPYrlUPb3aLuKsCgYLXlnz2o1SSCUiONOVeSXBOmjga9+a4QZtAVFhRNj+99N
         VUU/lH+4IS67kSeaAsy0cleWK8Eg9sd+RyJkm8kgFNr+dX0HeD3DfU0PNg0Fkfq1xuuH
         8zfphf7xKqnx5wO3+YAhIKrBHahR8VAJODrHpuLi2poMfKmDIN7MZ9KNkU0uKxgmFE8Q
         wPEeM07jDrAyxt0QIldRNMpd8Xzkm40IQR2CNpoDKOeJvFlG4KGyLGtXGUz/T+Yn6d0K
         G9+Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1783947478; x=1784552278; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tXeqG3zuIObLsUUPmSnJNLKn59cdNhsnjYph6ZlnxA4=;
        b=HcKLehGEXkBB6mk7QHwVfxy5Vv9jlzkkI8k7FoPwwgOnizcyPHIFcEN/wcR3Qyl8vA
         ooM4wN5uMuNjorIcGWMBz1jWAVZC/nFMzvuDmStaDsjAxsNRh7ygqtZWLNzcX3/DLlv0
         fCJGjO95DPvIaXFhb2ctslRk/VcDCS0WMnrPK/nwqDL9R/GPu4nW+Z/M19Hom6iX88fO
         Hn/8KcuLi5rrkPy0Xna0OA5nCPBU6MjvQLp4zAdfzFZPBZpWoeBZoFa1F17gcecSdUso
         dMy4Vc5MGEYgJMPFKZUFRfOAV0bjDIRBCNtsfit9I8lZ0qF7yp0wslS3dWyz5TN26IxV
         +Now==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947478; x=1784552278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tXeqG3zuIObLsUUPmSnJNLKn59cdNhsnjYph6ZlnxA4=;
        b=IUYTl/d3Fp/9bfLtg+e0Ua8byGwbmxLBieEiEU7G9Cuqis/MYNUI7MTaDID9etVofR
         y/jO1sQ7dLBr4buAj05cHPn2Xw3ayTDDhPwUIpWGQU0FU/s2c0LQQZzMpp4rccSG+6ES
         QjbPHO0aW93vDbqo9yeIQy59FW2ZrTlNfVRqxFfQpDLVcC96ZrHmc6wLvOloAImZCyjY
         EYMbVIKK9L0i5mMizMK8ty5PbG/eISKUGN450ckXB9cprk+gn9q0oy2DucELrE3mDqto
         QbVeymHHjFs3kg7e1+Aq++tJ3OBJ1qq8VNdyrBd5lZAzfsd7HkDHEqwwjFyaZGUAP+j5
         eXEA==
X-Forwarded-Encrypted: i=1; AHgh+RphKNVOazFPDPs93xwt+ZOpTnmM8kUB8Xs3JIi1BqCJBsuoeS/rD1R5/JWYJMoK9dFZx0ri7cAof1s=@lists.infradead.org
X-Gm-Message-State: AOJu0YxIFQ2QoQjKMHfmXBktvlLLBFwjzKGk55D18EHEfOKc3cNlWJ92
	qIynhPB7mGUnkidDR/90u3OPCkTVW8VxPj6yot0EoGouT8+v1HA+U2kQAOfIPa7jWdAYRedPQb6
	f/Cby52fM3xV5haVWtjhHnd8LQgmYJXQnBqp8vqAabg==
X-Gm-Gg: AfdE7cmLp3IU4UsW+0lThcPG56rtD4Dggj5+MEiufKzAMivY0OhtWRIsrbTSRVtz0ZG
	ps4joY7pBgglsNqP2yGd9eRhWKBFG0NhoPmzOAwBOtaBGT8xDTfrl6BK0wrk0cWJUQ3PET1ocXY
	uG1CAanXJ+QZZBXOrwY66w0j9cOOBtLcT8mPxlRq9xze3xUfPxSLtP4F5xcFCb4UIdodlFYHcSJ
	7Y1wJZcbtIgdEkoBMIXT4sJcP/5HO3sopnZNXZVhxtZ9xwX8EeAl6kujt5t6DbNhGvjEh91B8dz
	zcnsJfK1nrNxCBxHnOUq8qtIA3oLKeTQs0mt3db7fbiVC+s2NBdgL5NHqSqRN2dAhZMCvTzq0uA
	wk3xN+yaZVdhmhhf7O1TgXL1jyQ==
X-Received: by 2002:a05:600c:a47:b0:493:c83b:50d7 with SMTP id
 5b1f17b1804b1-493fa5ebd55mr76298675e9.6.1783947478052; Mon, 13 Jul 2026
 05:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260706181522.2003922-1-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260706181522.2003922-1-anup.patel@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Jul 2026 18:27:46 +0530
X-Gm-Features: AUfX_mznFq7jX5befSvsp60hLHfBrfMBiRvyp7t191jwa3YkScOz4hbTAguUPZ4
Message-ID: <CAAhSdy2Z1Rm+pFsv=SV8p9ZoYcu5uZNb1ihjYi46L3uQV2MHtA@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: KVM: Zicbo[m|z|p] block sizes should be always
 present in ONE_REG
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atish.patra@linux.dev>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_055800_147161_782A62A1 
X-CRM114-Status: GOOD (  21.91  )
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

T24gTW9uLCBKdWwgNiwgMjAyNiBhdCAxMTo0NeKAr1BNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBBbGwgY29uZmlnIGFuZCBjb3JlIHJlZ2lzdGVy
cyBvZiB0aGUgS1ZNIFJJU0MtViBPTkVfUkVHIGludGVyZmFjZSBhcmUKPiBleHBlY3RlZCB0byBi
ZSBhbHdheXMgYXZhaWxhYmxlIHRvIHRoZSBLVk0gdXNlci1zcGFjZSBhbmQgdGhlIEtWTQo+IGdl
dC1yZWctbGlzdCBzZWxmdGVzdCBhc3N1bWVzIHRoZXNlIHJlZ2lzdGVycyB0byBiZSBhcyBiYXNl
IHJlZ2lzdGVycy4KPgo+IEN1cnJlbnRseSwgdGhlIFppY2JvW218enxwXSBibG9jayBzaXplIGNv
bmZpZyByZWdpc3RlcnMgYXJlIG9ubHkKPiBhdmFpbGFibGUgd2hlbiBjb3JyZXNwb25kaW5nIElT
QSBleHRlbnNpb24gaXMgcHJlc2VudCBvbiB0aGUgaG9zdAo+IHdoaWNoIGJyZWFrcyB0aGUgYWJv
dmUgZXhwZWN0YXRpb24uIEluIGZhY3QsIEtWTSBnZXQtcmVnLWxpc3Qgc2VsZnRlc3QKPiBmYWls
cyB3aGVuIGFueSBvZiB0aGUgWmljYm9bbXx6fHBdIElTQSBleHRlbnNpb24gaXMgbm90IHByZXNl
bnQgb24KPiBob3N0LiBUbyBhZGRyZXNzIHRoaXMgaXNzdWUsIGRyb3AgdGhlIElTQSBleHRlbnNp
b24gY2hlY2tzIGZyb20KPiBrdm1fcmlzY3ZfdmNwdV9nZXQvc2V0X3JlZ19jb25maWcoKSBhbmQg
Y29weV9jb25maWdfcmVnX2luZGljZXMoKQo+IGZ1bmN0aW9ucy4KPgo+IEZpeGVzOiAwMzFmOWVm
YWZjMDggKCJLVk06IHJpc2N2OiBBZGQgS1ZNX0dFVF9SRUdfTElTVCBBUEkgc3VwcG9ydCIpCj4g
Rml4ZXM6IGEwNDRlZjcxMDQzZSAoIlJJU0MtVjogS1ZNOiB1c2UgRU5PRU5UIGluICpfb25lX3Jl
ZygpIHdoZW4gZXh0ZW5zaW9uIGlzIHVuYXZhaWxhYmxlIikKPiBGaXhlczogNDhlMmZlYmNkYTc0
ICgiUklTQy1WOiBLVk06IFByb3ZpZGUgVUFQSSBmb3IgWmljYm9wIGJsb2NrIHNpemUiKQo+IEZp
eGVzOiBjZjA1YjA1OWQ1OWYgKCJSSVNDLVY6IEtWTTogSW50cm9kdWNlIGNvbW1vbiBrdm1fcmlz
Y3ZfaXNhX2NoZWNrX2hvc3QoKSIpCj4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YW51cC5w
YXRlbEBvc3MucXVhbGNvbW0uY29tPgoKUXVldWVkIHRoaXMgcGF0Y2ggYXMgYSBmaXggZm9yIExp
bnV4LTcuMi1yY1gKClRoYW5rcywKQW51cAoKPiAtLS0KPiBDaGFuZ2VzIHNpbmNlIHYyOgo+ICAt
IFVwZGF0ZSBrdm1fcmlzY3ZfdmNwdV9zZXRfcmVnX2NvbmZpZygpIHRvIHJldHVybiAtRUlOVkFM
Cj4gICAgb25seSB3aGVuIHZhbHVlIGlzIG5vbi16ZXJvIGFuZCBkb2VzIG5vdCBtYXRjaCB1bmRl
cmx5aW5nCj4gICAgaG9zdCBjYWNoZSBibG9jayBzaXplLgo+IENoYW5nZXMgc2luY2UgdjE6Cj4g
IC0gVXBkYXRlIGt2bV9yaXNjdl92Y3B1X3NldF9yZWdfY29uZmlnKCkgdG8gcmV0dXJuIC1FSU5W
QUwKPiAgICBvbmx5IHdoZW4gWmljYm9bbXx6fHBdIElTQSBleHRlbnNpb24gaXMgZW5hYmxlZCBm
b3IgVkNQVQo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jIHwgMzggKysrKysr
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDMyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3Zt
L3ZjcHVfb25lcmVnLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jCj4gaW5kZXggYmI5
MjBlODkyM2M5Li42MTk4ODM4MjU3MGYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNw
dV9vbmVyZWcuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMKPiBAQCAtNTAs
MTkgKzUwLDEzIEBAIHN0YXRpYyBpbnQga3ZtX3Jpc2N2X3ZjcHVfZ2V0X3JlZ19jb25maWcoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LAo+ICAgICAgICAgICAgICAgICByZWdfdmFsID0gdmNwdS0+YXJj
aC5pc2FbMF0gJiBLVk1fUklTQ1ZfQkFTRV9JU0FfTUFTSzsKPiAgICAgICAgICAgICAgICAgYnJl
YWs7Cj4gICAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfQ09ORklHX1JFRyh6aWNib21fYmxvY2tf
c2l6ZSk6Cj4gLSAgICAgICAgICAgICAgIGlmIChrdm1fcmlzY3ZfaXNhX2NoZWNrX2hvc3QoWklD
Qk9NKSkKPiAtICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT0VOVDsKPiAtICAgICAg
ICAgICAgICAgcmVnX3ZhbCA9IHJpc2N2X2Nib21fYmxvY2tfc2l6ZTsKPiArICAgICAgICAgICAg
ICAgcmVnX3ZhbCA9IChrdm1fcmlzY3ZfaXNhX2NoZWNrX2hvc3QoWklDQk9NKSkgPyAwIDogcmlz
Y3ZfY2JvbV9ibG9ja19zaXplOwo+ICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGNh
c2UgS1ZNX1JFR19SSVNDVl9DT05GSUdfUkVHKHppY2Jvel9ibG9ja19zaXplKToKPiAtICAgICAg
ICAgICAgICAgaWYgKGt2bV9yaXNjdl9pc2FfY2hlY2tfaG9zdChaSUNCT1opKQo+IC0gICAgICAg
ICAgICAgICAgICAgICAgIHJldHVybiAtRU5PRU5UOwo+IC0gICAgICAgICAgICAgICByZWdfdmFs
ID0gcmlzY3ZfY2Jvel9ibG9ja19zaXplOwo+ICsgICAgICAgICAgICAgICByZWdfdmFsID0gKGt2
bV9yaXNjdl9pc2FfY2hlY2tfaG9zdChaSUNCT1opKSA/IDAgOiByaXNjdl9jYm96X2Jsb2NrX3Np
emU7Cj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NW
X0NPTkZJR19SRUcoemljYm9wX2Jsb2NrX3NpemUpOgo+IC0gICAgICAgICAgICAgICBpZiAoa3Zt
X3Jpc2N2X2lzYV9jaGVja19ob3N0KFpJQ0JPUCkpCj4gLSAgICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIC1FTk9FTlQ7Cj4gLSAgICAgICAgICAgICAgIHJlZ192YWwgPSByaXNjdl9jYm9wX2Js
b2NrX3NpemU7Cj4gKyAgICAgICAgICAgICAgIHJlZ192YWwgPSAoa3ZtX3Jpc2N2X2lzYV9jaGVj
a19ob3N0KFpJQ0JPUCkpID8gMCA6IHJpc2N2X2Nib3BfYmxvY2tfc2l6ZTsKPiAgICAgICAgICAg
ICAgICAgYnJlYWs7Cj4gICAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfQ09ORklHX1JFRyhtdmVu
ZG9yaWQpOgo+ICAgICAgICAgICAgICAgICByZWdfdmFsID0gdmNwdS0+YXJjaC5tdmVuZG9yaWQ7
Cj4gQEAgLTE0NCwyMSArMTM4LDE1IEBAIHN0YXRpYyBpbnQga3ZtX3Jpc2N2X3ZjcHVfc2V0X3Jl
Z19jb25maWcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ICAgICAgICAgICAgICAgICB9Cj4gICAg
ICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0NPTkZJR19S
RUcoemljYm9tX2Jsb2NrX3NpemUpOgo+IC0gICAgICAgICAgICAgICBpZiAoa3ZtX3Jpc2N2X2lz
YV9jaGVja19ob3N0KFpJQ0JPTSkpCj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1F
Tk9FTlQ7Cj4gLSAgICAgICAgICAgICAgIGlmIChyZWdfdmFsICE9IHJpc2N2X2Nib21fYmxvY2tf
c2l6ZSkKPiArICAgICAgICAgICAgICAgaWYgKHJlZ192YWwgJiYgcmVnX3ZhbCAhPSByaXNjdl9j
Ym9tX2Jsb2NrX3NpemUpCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
Cj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0NP
TkZJR19SRUcoemljYm96X2Jsb2NrX3NpemUpOgo+IC0gICAgICAgICAgICAgICBpZiAoa3ZtX3Jp
c2N2X2lzYV9jaGVja19ob3N0KFpJQ0JPWikpCj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIC1FTk9FTlQ7Cj4gLSAgICAgICAgICAgICAgIGlmIChyZWdfdmFsICE9IHJpc2N2X2Nib3pf
YmxvY2tfc2l6ZSkKPiArICAgICAgICAgICAgICAgaWYgKHJlZ192YWwgJiYgcmVnX3ZhbCAhPSBy
aXNjdl9jYm96X2Jsb2NrX3NpemUpCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7Cj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgY2FzZSBLVk1fUkVHX1JJ
U0NWX0NPTkZJR19SRUcoemljYm9wX2Jsb2NrX3NpemUpOgo+IC0gICAgICAgICAgICAgICBpZiAo
a3ZtX3Jpc2N2X2lzYV9jaGVja19ob3N0KFpJQ0JPUCkpCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIC1FTk9FTlQ7Cj4gLSAgICAgICAgICAgICAgIGlmIChyZWdfdmFsICE9IHJpc2N2
X2Nib3BfYmxvY2tfc2l6ZSkKPiArICAgICAgICAgICAgICAgaWYgKHJlZ192YWwgJiYgcmVnX3Zh
bCAhPSByaXNjdl9jYm9wX2Jsb2NrX3NpemUpCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIC1FSU5WQUw7Cj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgY2FzZSBLVk1f
UkVHX1JJU0NWX0NPTkZJR19SRUcobXZlbmRvcmlkKToKPiBAQCAtNjE0LDIwICs2MDIsNiBAQCBz
dGF0aWMgaW50IGNvcHlfY29uZmlnX3JlZ19pbmRpY2VzKGNvbnN0IHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSwKPiAgICAgICAgICAgICAgICAgdTY0IHNpemU7Cj4gICAgICAgICAgICAgICAgIHU2NCBy
ZWc7Cj4KPiAtICAgICAgICAgICAgICAgLyoKPiAtICAgICAgICAgICAgICAgICogQXZvaWQgcmVw
b3J0aW5nIGNvbmZpZyByZWcgaWYgdGhlIGNvcnJlc3BvbmRpbmcgZXh0ZW5zaW9uCj4gLSAgICAg
ICAgICAgICAgICAqIHdhcyBub3QgYXZhaWxhYmxlLgo+IC0gICAgICAgICAgICAgICAgKi8KPiAt
ICAgICAgICAgICAgICAgaWYgKGkgPT0gS1ZNX1JFR19SSVNDVl9DT05GSUdfUkVHKHppY2JvbV9i
bG9ja19zaXplKSAmJgo+IC0gICAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X2lzYV9jaGVja19o
b3N0KFpJQ0JPTSkpCj4gLSAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gLSAgICAg
ICAgICAgICAgIGVsc2UgaWYgKGkgPT0gS1ZNX1JFR19SSVNDVl9DT05GSUdfUkVHKHppY2Jvel9i
bG9ja19zaXplKSAmJgo+IC0gICAgICAgICAgICAgICAgICAgICAgICBrdm1fcmlzY3ZfaXNhX2No
ZWNrX2hvc3QoWklDQk9aKSkKPiAtICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiAt
ICAgICAgICAgICAgICAgZWxzZSBpZiAoaSA9PSBLVk1fUkVHX1JJU0NWX0NPTkZJR19SRUcoemlj
Ym9wX2Jsb2NrX3NpemUpICYmCj4gLSAgICAgICAgICAgICAgICAgICAgICAgIGt2bV9yaXNjdl9p
c2FfY2hlY2tfaG9zdChaSUNCT1ApKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVl
Owo+IC0KPiAgICAgICAgICAgICAgICAgc2l6ZSA9IElTX0VOQUJMRUQoQ09ORklHXzMyQklUKSA/
IEtWTV9SRUdfU0laRV9VMzIgOiBLVk1fUkVHX1NJWkVfVTY0Owo+ICAgICAgICAgICAgICAgICBy
ZWcgPSBLVk1fUkVHX1JJU0NWIHwgc2l6ZSB8IEtWTV9SRUdfUklTQ1ZfQ09ORklHIHwgaTsKPgo+
IC0tCj4gMi40My4wCj4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8va3ZtLXJpc2N2Cg==
