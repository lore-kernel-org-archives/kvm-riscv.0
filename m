Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5A0F5140F
	for <kvm-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 07:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qyp3SVrxyjz4fZXslubqGtJ9Bw2mCySN1j2Ldn2GxiI=; b=Q7rxk8hInqC4U7
	RvbvUsc3G6uRMkF0QGBdQ/UAB8XVUqu6wBIseA2O7Scsc+5vUmocTi+TLd/pOGCrzpR1xJg8mk0wQ
	9OC7trKhlaHyMxL8L389w5F8FWA+jRc6wPR3k0wM/cUD2xrwtR4HkI+8Q/h96q26qaEof56S7cEaJ
	klXkrxz8g4Aa4JLDZS2C/xor8oQlndLLoo4d0126uBDzOLCEvMevJsTVkEBcqIBVaKii6TiJF1thC
	M7OKlQ7lz2ISFgsWfgb0H90bWtgXuIavOCioDv/VDzTfbYae7AiGL9Ygd2sCDPQg6c/bARTWIxsU4
	zn5zNaBnyftt+BkSSNrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPEV-000000037Xf-2BAS;
	Fri, 06 Mar 2026 07:04:23 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPET-000000037Wy-1Xsc
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 07:04:22 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7d513bc15c7so10571822a34.1
        for <kvm-riscv@lists.infradead.org>; Thu, 05 Mar 2026 23:04:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772780660; cv=none;
        d=google.com; s=arc-20240605;
        b=BtTxP9oGsBGbY7jpih4IkWyNaxtRfXA3NhIHqcRq0EIRmTLdpES2VAjwSVoFAUYQEv
         zAaQDCrdwn8cFtjUcYyaI11ZAm+EmZLHvfHWY+QSEQThcZoNYb19tHPRkFW9z5c1HVrV
         b1nxi8TIVsNH37W7472xf3znYD3vp6nUA1GRpu3dzio6tZAKpU2esrfkXAWA4uOMUItN
         IJv4Six2KmkpVFouT8gdm7uBp+tvFAGQ8pWcudHkvIX7MqhMtVAz7h013jdclU+52VF3
         BIePKLV0Kd+9CUWpiLhA2DoT1Li8sqhT80pZKXlj848Xt+/7nJ5/9BtgHC4hvSPkmbv/
         3fUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yREeU4CE/jhwdCxENgT8cCU88WTqOERvy7IPLNknu0s=;
        fh=e5QMYQSKI2Q4nv10qnt1p+v4enBde1yUSNHPE4941XY=;
        b=FpjANlzcV0aivsSkOjfmIPy5OT9MgwJQYCTB2F9SNhjRq7FVAQT7XJW5XoTvdAOheg
         ErYzLEwQuaGgUTs9AOKxHaYkx6aMFBkTkk2HfRqAboisajrhjKqbxwmJvUV3yE7aN0Js
         9phro52WY9ChHFyJJsLDddRszf1BhOK9E5MRC+pS3MJ8Z9s/I+M1xJKVziiisqeO4cHT
         CPWyMO1X7C99Vl+eyUO7S8Ly/CR+lde1dCO+paCWqouqoZpN+uSvlvAF3MhuvmlKKXNQ
         f1Z3BVWzMPFApiZXTw5jLfDc9mOzUtw1S/CzuCzj/CrAmAOvA2Vp8YvvCtaIj/KXYqJA
         3F9w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772780660; x=1773385460; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yREeU4CE/jhwdCxENgT8cCU88WTqOERvy7IPLNknu0s=;
        b=BnjV/4DyhFxpN1Tb3k5Rr8DXwFVmaoSuh/eHYQzttVM0WtlwboeVnwphAPDaFWRm1O
         QGrPmfkNzqFubMFDb/99+Q7SqV6VSbsG5nel6Y1q/ERurTdb7GAotu9qq8lyU44CgRfP
         hTAxpd8PxmP/+2G3MkSnVowwnOAphFaTI2PAUrBMs5JjbMV1xNE4zGowz6xUGri6MAFr
         5eIaJOUdbanibYpEqEYOa5wh4HjPommuTDMBVZNflMWaSi9CZpJr7OiLC9U++2FDHa6E
         xanV8nZ7kZOxkDGwlmGNpKptvMj1vbTvlOfO+sKKjoE+gyQHn2SJd/qDn5Ae032S/4yH
         nrpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772780660; x=1773385460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yREeU4CE/jhwdCxENgT8cCU88WTqOERvy7IPLNknu0s=;
        b=bTvyI/Im9HXpNPDPyXPKPjN52LPp+dp5hfaPmGNRUgE8VIVc8HiFiDLVv03gJkV2uP
         xh0rGk8mHePIQ9F/EVDvIKGPPhntgfQyOgz8zcclHFVMcrVtZNQzVS699BvcsOZuJTIK
         2+D7pEFK96LRgjv3jbQDbd5Dp1YyOrn5j3RBL7FA483d6r6DgQy4R4n5hTTQVVErJoAE
         MNd+Rs+uQ23vus9/vUHm+5w2m/RdzsBX7okSIzNoPZdRE2hg1oYzheKsfZ3EOLpzf9zk
         fcyMTA/Y+ALke4Mq9NsqymsL/MO/26cmNK7i0bvNkUQQdJGjnVhBaz+cBmxbB/PqXgpu
         tfCw==
X-Forwarded-Encrypted: i=1; AJvYcCVYMgJw/hJdLo0St8LsSckEZUNoYgi0k9C/ZDki6bYs6ma/3Ds2wzG+zUtAoRYEiib+8eevI7GP31Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YzWtmjN5KG9nB/s+deKYlq+aV3kjVJOcADksfslr2vevF2yv8oG
	j/tBvJEycKi+qgpRH/Ahb9i4NTrEZfix4b+LplqVb2kSXLsW2Ze0lfmD5VYZFQ/feDKKkMvf8Cy
	IiGGrX42rGLZBMHXjjf/sjjUBT7GrBgQNnbxgMJy13Q==
X-Gm-Gg: ATEYQzyz1cfGSeDymA+t4m7ZP1kZel+d38QLfrDk0ZFP2AAmvnm6I5yV0XX10cyCnkg
	JpyZ2mG94fpxNB6f9b5DAZzuUSB5T8O+5kHpeDtbHPM74Dr8mfLcbk0+Z6cMzzZoy1cSNuC5aLZ
	LKlcAao9bG+ubuq0IT9+d4NjstGucwXvHkGY0nj5OII16BZnyzL9jtywCXm+PKFYQ2T4bCt3VL9
	p4OhIHvanCB+8KhXW5itiuZeTuI+iMyyewcXY9xN07ZSNgMPByNXJsmL7FcTtJMsmivzA1aPW59
	9ajh4Ukn/7D/DCn2RpcMRrzL8m0f07147mE94Ro8wPzhDC7KB3ZWO8AGXFQ97lmQU9OIuu2bw2J
	0gRqczFVP5dSmQRQlESL5Alltog==
X-Received: by 2002:a05:6820:1b05:b0:674:62e7:190f with SMTP id
 006d021491bc7-67b9bca7baamr925571eaf.17.1772780660047; Thu, 05 Mar 2026
 23:04:20 -0800 (PST)
MIME-Version: 1.0
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com> <20260120080013.2153519-2-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260120080013.2153519-2-anup.patel@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 6 Mar 2026 12:34:08 +0530
X-Gm-Features: AaiRm533kBoYnXDCQRSDQXrP3bNbpBpz22jiDNqrmWLzZZYwaIGtUWbuuXDPWwo
Message-ID: <CAAhSdy2u3C2JyakhnSZxuSO2ecJsaz9DXWkRp96CArqHz4Ce9w@mail.gmail.com>
Subject: Re: [PATCH 01/27] RISC-V: KVM: Fix error code returned for Smstateen ONE_REG
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	Shuah Khan <shuah@kernel.org>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_230421_673498_818EF23A 
X-CRM114-Status: GOOD (  14.88  )
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

T24gVHVlLCBKYW4gMjAsIDIwMjYgYXQgMTozMOKAr1BNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBSZXR1cm4gLUVOT0VOVCBmb3IgU21zdGF0ZWVu
IE9ORV9SRUcgd2hlbjoKPiAxKSBTbXN0YXRlZW4gaXMgbm90IGVuYWJsZWQgZm9yIGEgVkNQVQo+
IDIpIFdoZW4gT05FX1JFRyBpZCBpcyBvdXQgb2YgcmFuZ2UKPgo+IFRoaXMgd2lsbCBtYWtlIFNt
c3RhdGVlbiBPTkVfUkVHIGVycm9yIGNvZGVzIGNvbnNpc3RlbnQKPiB3aXRoIG90aGVyIE9ORV9S
RUcgaW50ZXJmYWNlcyBvZiBLVk0gUklTQy1WLgo+Cj4gRml4ZXM6IGMwNDkxM2YyYjU0ZSAoIlJJ
U0NWOiBLVk06IEFkZCBzc3RhdGVlbjAgdG8gT05FX1JFRyIpCj4gU2lnbmVkLW9mZi1ieTogQW51
cCBQYXRlbCA8YW51cC5wYXRlbEBvc3MucXVhbGNvbW0uY29tPgoKUXVldWVkIHRoaXMgYXMgZml4
IGZvciBMaW51eC03LjAtcmNYCgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2
bS92Y3B1X29uZXJlZy5jIHwgMTggKysrKysrKystLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jCj4g
aW5kZXggZTdhYjZjYjAwNjQ2Li42ZGFiNGRlZWQ4NmQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9rdm0vdmNwdV9vbmVyZWcuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMK
PiBAQCAtNTQ5LDkgKzU0OSwxMSBAQCBzdGF0aWMgaW5saW5lIGludCBrdm1fcmlzY3ZfdmNwdV9z
bXN0YXRlZW5fc2V0X2NzcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gIHsKPiAgICAgICAgIHN0
cnVjdCBrdm1fdmNwdV9zbXN0YXRlZW5fY3NyICpjc3IgPSAmdmNwdS0+YXJjaC5zbXN0YXRlZW5f
Y3NyOwo+Cj4gKyAgICAgICBpZiAoIXJpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKHZjcHUt
PmFyY2guaXNhLCBTTVNUQVRFRU4pKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVOT0VOVDsK
PiAgICAgICAgIGlmIChyZWdfbnVtID49IHNpemVvZihzdHJ1Y3Qga3ZtX3Jpc2N2X3Ntc3RhdGVl
bl9jc3IpIC8KPiAgICAgICAgICAgICAgICAgc2l6ZW9mKHVuc2lnbmVkIGxvbmcpKQo+IC0gICAg
ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9F
TlQ7Cj4KPiAgICAgICAgICgodW5zaWduZWQgbG9uZyAqKWNzcilbcmVnX251bV0gPSByZWdfdmFs
Owo+ICAgICAgICAgcmV0dXJuIDA7Cj4gQEAgLTU2Myw5ICs1NjUsMTEgQEAgc3RhdGljIGludCBr
dm1fcmlzY3ZfdmNwdV9zbXN0YXRlZW5fZ2V0X2NzcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4g
IHsKPiAgICAgICAgIHN0cnVjdCBrdm1fdmNwdV9zbXN0YXRlZW5fY3NyICpjc3IgPSAmdmNwdS0+
YXJjaC5zbXN0YXRlZW5fY3NyOwo+Cj4gKyAgICAgICBpZiAoIXJpc2N2X2lzYV9leHRlbnNpb25f
YXZhaWxhYmxlKHZjcHUtPmFyY2guaXNhLCBTTVNUQVRFRU4pKQo+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gLUVOT0VOVDsKPiAgICAgICAgIGlmIChyZWdfbnVtID49IHNpemVvZihzdHJ1Y3Qga3Zt
X3Jpc2N2X3Ntc3RhdGVlbl9jc3IpIC8KPiAgICAgICAgICAgICAgICAgc2l6ZW9mKHVuc2lnbmVk
IGxvbmcpKQo+IC0gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiArICAgICAgICAgICAg
ICAgcmV0dXJuIC1FTk9FTlQ7Cj4KPiAgICAgICAgICpvdXRfdmFsID0gKCh1bnNpZ25lZCBsb25n
ICopY3NyKVtyZWdfbnVtXTsKPiAgICAgICAgIHJldHVybiAwOwo+IEBAIC01OTUsMTAgKzU5OSw3
IEBAIHN0YXRpYyBpbnQga3ZtX3Jpc2N2X3ZjcHVfZ2V0X3JlZ19jc3Ioc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LAo+ICAgICAgICAgICAgICAgICByYyA9IGt2bV9yaXNjdl92Y3B1X2FpYV9nZXRfY3Ny
KHZjcHUsIHJlZ19udW0sICZyZWdfdmFsKTsKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAg
ICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfQ1NSX1NNU1RBVEVFTjoKPiAtICAgICAgICAgICAgICAg
cmMgPSAtRUlOVkFMOwo+IC0gICAgICAgICAgICAgICBpZiAocmlzY3ZfaGFzX2V4dGVuc2lvbl91
bmxpa2VseShSSVNDVl9JU0FfRVhUX1NNU1RBVEVFTikpCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgcmMgPSBrdm1fcmlzY3ZfdmNwdV9zbXN0YXRlZW5fZ2V0X2Nzcih2Y3B1LCByZWdfbnVtLAo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgJnJlZ192YWwpOwo+ICsgICAgICAgICAgICAgICByYyA9IGt2bV9yaXNjdl92Y3B1X3Nt
c3RhdGVlbl9nZXRfY3NyKHZjcHUsIHJlZ19udW0sICZyZWdfdmFsKTsKPiAgICAgICAgICAgICAg
ICAgYnJlYWs7Cj4gICAgICAgICBkZWZhdWx0Ogo+ICAgICAgICAgICAgICAgICByYyA9IC1FTk9F
TlQ7Cj4gQEAgLTY0MCwxMCArNjQxLDcgQEAgc3RhdGljIGludCBrdm1fcmlzY3ZfdmNwdV9zZXRf
cmVnX2NzcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gICAgICAgICAgICAgICAgIHJjID0ga3Zt
X3Jpc2N2X3ZjcHVfYWlhX3NldF9jc3IodmNwdSwgcmVnX251bSwgcmVnX3ZhbCk7Cj4gICAgICAg
ICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0NTUl9TTVNUQVRF
RU46Cj4gLSAgICAgICAgICAgICAgIHJjID0gLUVJTlZBTDsKPiAtICAgICAgICAgICAgICAgaWYg
KHJpc2N2X2hhc19leHRlbnNpb25fdW5saWtlbHkoUklTQ1ZfSVNBX0VYVF9TTVNUQVRFRU4pKQo+
IC0gICAgICAgICAgICAgICAgICAgICAgIHJjID0ga3ZtX3Jpc2N2X3ZjcHVfc21zdGF0ZWVuX3Nl
dF9jc3IodmNwdSwgcmVnX251bSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ192YWwpOwo+ICsgICAgICAgICAgICAgICBy
YyA9IGt2bV9yaXNjdl92Y3B1X3Ntc3RhdGVlbl9zZXRfY3NyKHZjcHUsIHJlZ19udW0sIHJlZ192
YWwpOwo+ICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGRlZmF1bHQ6Cj4gICAgICAg
ICAgICAgICAgIHJjID0gLUVOT0VOVDsKPiAtLQo+IDIuNDMuMAo+CgotLSAKa3ZtLXJpc2N2IG1h
aWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
