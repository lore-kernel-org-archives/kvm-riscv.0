Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEA9D3F07D
	for <kvm-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 15:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cqHb+oN+f9gdmVMyHCe8wr0EUPe4Rql37qt6S5iJR8A=; b=Wb57wX3E/+Fjkl
	HFQXxdm8lkasQvelgGLqHsEvS6/RehOzTO6LS3Mh5Qm9Z1iCn+i0JfCns7POtV0QjaZCrnhMYI9/K
	5ikqj2hh4zZphJSmjxWzEBKnbE3lgKn+iLgTqygjpGuv0rSaPsWHSGxPFRnw3XbfSPOpUKpO45mXF
	L+fB0HkH01gSgkCjiLXEDhywwhNvjPQz+JPJijfz/bSe0Vg8iJpCgC7tBl5ocd83H1JnFjPpIXquW
	Yabi6yS5M+lTbRQp8jd6u+czCfNscqFpJ8LncV9WUpVCi4say9tM+XDBVVbCCtqd6mg9MmagD21Ad
	j0JbceicH46IOXXWMsBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7AF-0000000GFAK-2Msr;
	Wed, 28 Jan 2026 15:09:03 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7AD-0000000GF9P-2imq
	for kvm-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 15:09:03 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-45c889aba0dso507521b6e.0
        for <kvm-riscv@lists.infradead.org>; Wed, 28 Jan 2026 07:09:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769612940; cv=none;
        d=google.com; s=arc-20240605;
        b=QiZXLyztzSpBVPkDyofeQyXACktOcCvcyuoD9d3oR9xfsMAQPiTeNRbGmEJ+7IYRpL
         qeD9tBegOhIoaPrq54fLAb/O8+Sdiq8/2zrdvQ99Wc8PlURB4wapUcDaPBd60y37bM3+
         rrU48AqFK+BM7nb7VJ/vuaio0xZW+GRIpmmno2zmn/Wm035XCdQROy+jxaRUb5+7kFQE
         BafhQIdW2VbR0q2/ZNbtd1bV/GgTLXrY7RJ5lSaroLsH0ynk+C1o175ozcEnEfpwZUxt
         vAKJ5BT1bN8Mc9IKgzpycURt7tQ7YEqFBquE8cTgxkncGryphkK5hPy1AlQjet+t1sul
         kr3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xImSaumXjiTjPnMx4RKwPEYhdrOmxFBV6+72e58SeRA=;
        fh=pk8IkUO5md4BxXNyhgoGm62rEScYn/zlmtzzp0deYcE=;
        b=Ck+RRNBWk4FVgjTEUiz6I6iqvuz9MgZdhu/E4JKK+xe2KfVR9VbUgOAAU1cNjTn/4W
         LjtU9zU/H9Goj5Y/C+r36d/fPkRbARhFcRD1r2aI134slcAevwAc24GvS9s4NnJ6tzRT
         8OKMcXMjS/NoxhKAaU7aoKx6ANQXLAui6KIThe8RTRU+X47qrV1Va+69IWl7LJ9S+pX3
         XjBne73gzVxLrYIVaFQ9jebaj27aPwDIbkvI6ZLdblfrohpabzR/rgahvuTrc/14JMWf
         kDOXJyBDBwTsy1l50UYax3MbiY1lpeUdXKlqMQ0or2h6xxzBPT+vNS+cPUGPqL1MtEW6
         Ya7Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1769612940; x=1770217740; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xImSaumXjiTjPnMx4RKwPEYhdrOmxFBV6+72e58SeRA=;
        b=bJEmsHBOBYgPxETl0ckXo/+SgWzNdetqCrquZtz0RgPS/rJqhuEdtpAPjFRth4GXc0
         qjF8s36JgiUpEGrMqqzbP+CCyBjQcNIzwggfMTn4fVXSZQAVLbj/IlZFAAX07fBSWWjM
         5LQnRbaWaEbgECjc8dEwDxkEUfYaussk1lBILS8KmI/u1D6fv0PEf2+kJXgNAKwokLE1
         TJ0VG9JOXMT9VbAwMVPfOE4feykV2npkvg709QpDpcSflXyMAh/JDcGqW4reuRtXy/sZ
         hR9AtkoLuCVal2YNcwakrL2I5utezfWkSPQRm00ald4v72QZVF21FzYD0ZTgKzNTacl0
         DjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769612940; x=1770217740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xImSaumXjiTjPnMx4RKwPEYhdrOmxFBV6+72e58SeRA=;
        b=KBY+VI4GGdfbMTbGlNPLq8awVBRxlc+45aLSKVfxuVB/8efX1yUx7d7VJuSHu/uYXy
         MZdxdwLEutrzB1nTQmh/J5WLXNaIzKKi9seszqFiLLHhDa2h++Jozrdqm7W+ELiNMXF6
         zPk+49gjPfuWKKej0PFCpIbkCF9A+ogJjRhGMS4lFRFUQKC6nMl8v4bHqkG83CRBSInk
         vYmqSOkUR0Fc9jt7lUu23biahQgXcYS/nxhnVKoOxExSwCysx1iVJBZlKjube+vf4RWp
         EolZeOvgm63N9CjzjT6SgOoI+Bt2rZCbRDuU/+7xEyNInWl4qQ6fG3wFLxlr+y2x/hZY
         BGUw==
X-Forwarded-Encrypted: i=1; AJvYcCX/3FybVXyl24m043z7cCNcNHryAyk3tw6VxnZi/XOFBEKK87zbx6pX7JD89+kDQLqHgMEGSHz+bxg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwOwLM8VrZBFJZQ1fERnYdsipTB1nXFTXrsWgHyZwESmxFKHUfx
	GY+jNdmnIQrPXzi7DXcvOyQ8HVoeUMnanfboW8AHMgHryXTMCbmtkZ6NfmLLX8SV6XyRwN6NwQn
	zsBgTx5stCv/I0BQPklG8UY3zvZf0agWphjezwi5FKRPfX+iLxxPY
X-Gm-Gg: AZuq6aLyQEYvpa0YvBe+Fwov/KZgG0D5lv27wPXlaB8Gb8tMSewqVKyRUJ3YL1WOO3f
	QUa9j1F3Hfb2NrYBnF5L+RtSN3X6KdW0qXd16UVbNWUc+zD1ZHFyDMvfgY7KgKH9ijV6/TwfBoa
	mUAFQWtgeYno/h8FN8we4XaMERhTKh2o+3b99b2LPYvBagiYt9CSetCQRCOrIu7ni3H+QvrkkHH
	RihoPYS9aJq7S43Wx8qhLNcCRPVlc3M1R4yoaz5gor3xV1iK4sQiobN2CA9bRbuHhOnYE1fBP+X
	wvPfWIVOA5F3TvSXKi2qmewaO+YTSSJjISIxA/HfFERNtuyzU46i5yYW3MI=
X-Received: by 2002:a05:6820:1c9f:b0:662:fb9f:9562 with SMTP id
 006d021491bc7-662fb9f97b2mr1829587eaf.36.1769612940354; Wed, 28 Jan 2026
 07:09:00 -0800 (PST)
MIME-Version: 1.0
References: <20260127084313.3496485-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260127084313.3496485-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 28 Jan 2026 20:38:49 +0530
X-Gm-Features: AZwV_Qh8I6bUk6UmnyFbVlzL4EfGOlNYkPHELnidmBp1u2PFu_cRJl5OIdn6_MM
Message-ID: <CAAhSdy3DEXBniBDqyRpPxidB8gO6L_8bHMbJotX16eXyD0mYgg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Skip IMSIC update if vCPU IMSIC state is not initialized
To: Jiakai Xu <jiakaipeanut@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Jiakai Xu <xujiakai2025@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_070901_714592_2139A6C6 
X-CRM114-Status: GOOD (  19.27  )
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

T24gVHVlLCBKYW4gMjcsIDIwMjYgYXQgMjoxM+KAr1BNIEppYWthaSBYdSA8amlha2FpcGVhbnV0
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBrdm1fcmlzY3ZfdmNwdV9haWFfaW1zaWNfdXBkYXRlKCkg
YXNzdW1lcyB0aGF0IHRoZSB2Q1BVIElNU0lDIHN0YXRlIGhhcwo+IGFscmVhZHkgYmVlbiBpbml0
aWFsaXplZCBhbmQgdW5jb25kaXRpb25hbGx5IGFjY2Vzc2VzIGltc2ljLT52c2ZpbGVfbG9jay4K
PiBIb3dldmVyLCBpbiBmdXp6ZWQgaW9jdGwgc2VxdWVuY2VzLCB0aGUgQUlBIGRldmljZSBtYXkg
YmUgaW5pdGlhbGl6ZWQgYXQKPiB0aGUgVk0gbGV2ZWwgd2hpbGUgdGhlIHBlci12Q1BVIElNU0lD
IHN0YXRlIGlzIHN0aWxsIE5VTEwuCj4KPiBUaGlzIGxlYWRzIHRvIGludmFsaWQgYWNjZXNzIHdo
ZW4gZW50ZXJpbmcgdGhlIHZDUFUgcnVuIGxvb3AgYmVmb3JlCj4gSU1TSUMgaW5pdGlhbGl6YXRp
b24gaGFzIGNvbXBsZXRlZC4KPgo+IFRoZSBjcmFzaCBtYW5pZmVzdHMgYXM6Cj4gICBVbmFibGUg
dG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVxdWVzdCBhdCB2aXJ0dWFsIGFkZHJlc3MKPiAgIGRm
ZmZmZmZmMDAwMDAwMDYKPiAgIC4uLgo+ICAga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX3VwZGF0
ZSBhcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYzo4MDEKPiAgIGt2bV9yaXNjdl92Y3B1X2FpYV91
cGRhdGUgYXJjaC9yaXNjdi9rdm0vYWlhX2RldmljZS5jOjQ5Mwo+ICAga3ZtX2FyY2hfdmNwdV9p
b2N0bF9ydW4gYXJjaC9yaXNjdi9rdm0vdmNwdS5jOjkyNwo+ICAgLi4uCj4KPiBBZGQgYSBndWFy
ZCB0byBza2lwIHRoZSBJTVNJQyB1cGRhdGUgcGF0aCB3aGVuIGltc2ljX3N0YXRlIGlzIE5VTEwu
IFRoaXMKPiBhbGxvd3MgdGhlIHZDUFUgcnVuIGxvb3AgdG8gY29udGludWUgc2FmZWx5Lgo+Cj4g
VGhpcyBpc3N1ZSB3YXMgZGlzY292ZXJlZCBkdXJpbmcgZnV6emluZyBvZiBSSVNDLVYgS1ZNIGNv
ZGUuCj4KPiBGaXhlczogZGI4YjdlOTdkNjEzN2EgKCJSSVNDLVY6IEtWTTogQWRkIGluLWtlcm5l
bCB2aXJ0dWFsaXphdGlvbiBvZiBBSUEgSU1TSUMiKQo+IFNpZ25lZC1vZmYtYnk6IEppYWthaSBY
dSA8eHVqaWFrYWkyMDI1QGlzY2FzLmFjLmNuPgo+IFNpZ25lZC1vZmYtYnk6IEppYWthaSBYdSA8
amlha2FpUGVhbnV0QGdtYWlsLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8
YW51cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC02LjIwCgpU
aGFua3MsCkFudXAKCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYyB8IDQgKysr
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMgYi9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYwo+IGlu
ZGV4IGU1OTdlODY0OTFjM2IuLmE3ZDM4N2UyODBkNDkgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9rdm0vYWlhX2ltc2ljLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYwo+IEBA
IC03OTcsNiArNzk3LDEwIEBAIGludCBrdm1fcmlzY3ZfdmNwdV9haWFfaW1zaWNfdXBkYXRlKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAgICAgICAgIGlmIChrdm0tPmFyY2guYWlhLm1vZGUgPT0g
S1ZNX0RFVl9SSVNDVl9BSUFfTU9ERV9FTVVMKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gMTsK
Pgo+ICsgICAgICAgLyogSU1TSUMgdkNQVSBzdGF0ZSBtYXkgbm90IGJlIGluaXRpYWxpemVkIHll
dCAqLwo+ICsgICAgICAgaWYgKCFpbXNpYykKPiArICAgICAgICAgICAgICAgcmV0dXJuIDE7Cj4g
Kwo+ICAgICAgICAgLyogUmVhZCBvbGQgSU1TSUMgVlMtZmlsZSBkZXRhaWxzICovCj4gICAgICAg
ICByZWFkX2xvY2tfaXJxc2F2ZSgmaW1zaWMtPnZzZmlsZV9sb2NrLCBmbGFncyk7Cj4gICAgICAg
ICBvbGRfdnNmaWxlX2hnZWkgPSBpbXNpYy0+dnNmaWxlX2hnZWk7Cj4gLS0KPiAyLjM0LjEKPgoK
LS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
