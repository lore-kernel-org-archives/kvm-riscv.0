Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F450E9A02C
	for <kvm-riscv@archiver.kernel.org>; Wed, 18 Feb 2026 21:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qvSwPFbOvkStkdVk1wdaiQDyOSoTxTFPYGXrSvVv6X0=; b=n9bg0Gwd62lcWu
	9diOPJlzzVsVYD3dZODNapaJSrbsqO1Op8dPCzigWI0Rbj8w3Lrr9rt/pfLPMjkuxKmRmz3kXhNZp
	WYYHL0pBV3PLM2YZhnbLhE8xN51h7tkAjbQJXcaFTKgiHo6PLiIVi15izUyb9kiNDUBn1CGvnyGVQ
	omUze6cNAZlq/HK4EctAqwk2dnlHqL6S8vrENmJyNfVQhfkQbiwhEC/aIeecCK5alTxEnoTA2O6ZS
	FkxCwdWkxavdqk0AMv5BcWWh0ydJ/eheA1/Pg+pI0xinOU9Rl0XJ/6peZd81KtUeRhk04jcsYTVw9
	OHRNexlLKYODwWyuxhxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsowA-0000000AR6q-04Yd;
	Wed, 18 Feb 2026 21:18:22 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsow7-0000000AR5J-323o
	for kvm-riscv@lists.infradead.org;
	Wed, 18 Feb 2026 21:18:20 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-944168e8c5fso148271241.2
        for <kvm-riscv@lists.infradead.org>; Wed, 18 Feb 2026 13:18:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771449498; cv=none;
        d=google.com; s=arc-20240605;
        b=FTvVB0z5P0R2hUK/5Q+F1qZXQ773cgbORcV7lNPEa7LbYvaLvO+N+NfrTmeRz5C6ux
         VdXR7T5XioeKiq1+JOErAWvYJiVFNikHyKkJcSErm0WLZJusCIhBqP6/avAWnG6ZOCp8
         /TDh8rrlFSu96ekjx9VYPYUzLwjleKhfipYJCrAK64VWMdbvPOFvXwj1f+sXoj/q3KTq
         m98uTq7pUfCdno6My9+TImE3WdKC4/mgXCNri+L6uruP8AP6ZoEwql7YC6Ismfa9SIjk
         3mlY9yRhN+IQFeBGIB3iPO8XHzXaAONlrjOqw15MZhqJKVD35JOSr5txBh/STJcA7tNL
         ydZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bRlThRjj5FGBFKrZjR9u+oYoIGMr3781os1xSOsBbRo=;
        fh=vZ8qFSBbGajLgKno6iXYmmDcobL/crD9JUpd/h3hxRA=;
        b=SgmcWGVEUGAuH4PGAXH74bEZNWNztDcjfmzYPirKq80Sp8OlF+++n4bIXBAW0wySDs
         8TMvR2HHWVo4DXhEJVlIQGpG9IjZaYS4HChPV8DegbAouxYzDLJMB06h1WvLoxssixd4
         +fJUXBZD5LbqZXgpv4PHcqUQb9/UnMAoAVP/z0B9GASCeQgoFYskA/0Wmowxo72ORWLt
         Cy28CFR6zkBsCVPG3hUV7XbUniSSr7OVibhGZV5kdqiWbpLoO21NVstAhRrO2zk58CEB
         ggND4mgvUUw2SA7WTldALWesiZW0gGCOxqgje64O7Th6c9deWrKjFDETrHevaclVwFe5
         s05A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771449498; x=1772054298; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRlThRjj5FGBFKrZjR9u+oYoIGMr3781os1xSOsBbRo=;
        b=WERPIGLQdtPso091LX8r2Vuc0JBV7ZQo2cl2lvFOyKUZJQ2yl4XkWFe1FPMadG5pL0
         hDuAD2yurPsY00N+urI6smL4ft83n883m76gAybj6NtiJZ4eeCd8rp9RotWjDIaAL5bo
         uyrzogAe1VF2kSEArO0qGsa7M5b5SZWQf3tmfNWhtDhj5Z/0EXGV3LTdFcGszof6+hS/
         KR5Unj42X8cb7wMeyxjbvHcdRHfzfzWIEzhilNO6Kpx5LiaPiRMZkzgCVheZPRfDdtFl
         MidoQZ+w/PteaU205xYOKX6ep02tLjCRIWAzaIRQ2ETehqLSXPCdgi71vk1/Vo3ohPRJ
         S/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771449498; x=1772054298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bRlThRjj5FGBFKrZjR9u+oYoIGMr3781os1xSOsBbRo=;
        b=T0LYynXIMfGenYUkWdJenxVfjr4xzGwDkFYMoD65RUs9brJHr36peg5LZjmVY4mDUD
         4/MN2Hz5/gWGUHJ+nVRFd1lObEI2htP1OVY0kJhZcLk8A2grmXHOuib62WQ7ittCcri5
         Bc0wCyWTebViSiSdIKhNovltunJyTLhwYWyOmVkdkANt1cG/+y31eXZ7cyuTEikPPusU
         6XoTScDi+oaTZ5yYGDDhMVaCBu+NMKVDgNKpj5mZzH0Kvr+IxClLGLDPOsdtrxgJE6nQ
         uFyXfvtQ9itSUUXYGyDQxIu8X/7x136lmSCrBIkKAT9dzYcLWH87Py3CaUVzvNxSpVn3
         rPcA==
X-Forwarded-Encrypted: i=1; AJvYcCXEqfOe5vz+MyJz2MI5MrDRXLsnPyZBCQjOBZk1Oecs+CcsnTHM8bF3V9vKL5AUXaWIaStOm0JlrdQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwKhzw8H2SdzIZ7aS5fWD6jVdp/qI5EAVQdgquhhAgSvm8kBAMt
	kJLHoBC2v9YVxLE4yY1fRle/uwQ1xV8NTNJhzpeREgGJ6iUFnxGL3BQ3zCJLMyxixmlDaw5hSPD
	Dv0qxom7GzZpIz48tZQ8e5sp+G7Vt5/cuRpd58znT
X-Gm-Gg: AZuq6aI5jjxaFMFvF86OF3JV1d052dqHtiDFjf90qZW5zY/MaGV1fvNZq0bICS1D57m
	rzuo75LpaYn1k9j0v+/f1IiWc7CPrwJlnvnUyC8QCmG5iJtwi+8+YVnoGb5yVTeO0lYh36moFu5
	K4J9/5cWL6sAleeMyHMZ/K9APTIxI/YxQehgXsA65lfUfMvZdkrVE3DMrov+WddDPPLg46KbMxv
	jtDXv/URB5wzNQ3mrnLrqTXnTnSVn9O8mjV2Oe7LU2NSxZJBhJx0W3n32rx0+m/VD6rkzDFxLqS
	HXYYvK8=
X-Received: by 2002:a05:6102:32cd:b0:5db:efcb:72 with SMTP id
 ada2fe7eead31-5fe2ad39b83mr6208741137.6.1771449497123; Wed, 18 Feb 2026
 13:18:17 -0800 (PST)
MIME-Version: 1.0
References: <20250501183304.2433192-1-dmatlack@google.com> <aBPhs39MJz-rt_Ob@google.com>
 <CALzav=eqv0Fh9pzaBgjZ-fehwFbD4YscoLQz0=o0TKQT_zLTwQ@mail.gmail.com>
 <aRZ9SQ_G2lsmXtur@google.com> <CALzav=fN4FpZsfzwbdLeNSj4nx4OpRkwHvKiZNVgP8S-zsUvJA@mail.gmail.com>
 <aZYpv6O15YMlGkzT@google.com>
In-Reply-To: <aZYpv6O15YMlGkzT@google.com>
From: David Matlack <dmatlack@google.com>
Date: Wed, 18 Feb 2026 13:17:48 -0800
X-Gm-Features: AaiRm50oQAsne8PMukHk2_Ehws0mlHrvXf3-klwm2DNfi8keZfRuu7miCV2uiLE
Message-ID: <CALzav=cc9y2sp66QRwv=DCpb1j8fNjLWbsiqDVK9UE4e2kthzQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] KVM: selftests: Convert to kernel-style types
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Eric Auger <eric.auger@redhat.com>, 
	James Houghton <jthoughton@google.com>, Colin Ian King <colin.i.king@gmail.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_131819_776133_EBA7E2D6 
X-CRM114-Status: GOOD (  20.57  )
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

T24gV2VkLCBGZWIgMTgsIDIwMjYgYXQgMTowNuKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgRGVjIDAzLCAyMDI1LCBEYXZpZCBN
YXRsYWNrIHdyb3RlOgo+ID4gT24gVGh1LCBOb3YgMTMsIDIwMjUgYXQgNDo1MuKAr1BNIFNlYW4g
Q2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPiA+ID4gTXkgc2xvd25l
c3MgaXMgbGFyZ2VseSBiZWNhdXNlIEknbSBub3Qgc3VyZSBob3cgdG8gbGFuZC9hcHByb2FjaCB0
aGlzLiAgSSdtIDEwMCUKPiA+ID4gaW4gZmF2b3Igb2YgdGhlIHJlbmFtZXMsIGl0J3MgdGhlIHRp
bWluZyBhbmQgY29vcmRpbmF0aW9uIEknbSB1bnN1cmUgb2YuCj4gPiA+Cj4gPiA+IEluIGhpbmRz
aWdodCwgaXQgcHJvYmFibHkgd291bGQgaGF2ZSBiZXN0IHRvIHNxdWVlemUgaXQgaW50byA2LjE4
LCBzbyBhdCBsZWFzdAo+ID4gPiB0aGUgbW9zdCByZWNlbnQgTFRTIHdvdWxkbid0IGdlbmVyYXRl
IGNvbmZsaWN0cyBhbGwgb3ZlciB0aGUgcGxhY2UuICBUaGUgbmV4dAo+ID4gPiBiZXN0IG9wdGlv
biB3b3VsZCBwcm9iYWJseSBiZSB0byBzcGluIGEgbmV3IHZlcnNpb24sIGJyaWJlIFBhb2xvIHRv
IGFwcGx5IGl0IGF0Cj4gPiA+IHRoZSBlbmQgb2YgdGhlIG5leHQgbWVyZ2Ugd2luZG93LCBhbmQg
dGFnIHRoZSB3aG9sZSB0aGluZyBmb3Igc3RhYmxlQCAobWF5YmUKPiA+ID4gbGltaXRlZCB0byA2
LjE4Kz8pIHRvIG1pbmltaXplIGRvd25zdHJlYW0gcGFpbi4KPiA+Cj4gPiBXaXRoIExQQyBjb21p
bmcgdXAgSSB3b24ndCBoYXZlIGN5Y2xlcyB0byBwb3N0IGEgbmV3IHZlcnNpb24gYmVmb3JlCj4g
PiB0aGUgNi4xOSBtZXJnZSB3aW5kb3cgY2xvc2VzLgo+ID4KPiA+IEknbSB0ZW1wdGVkIHRvIHNh
eSBsZXQncyBqdXN0IHdhaXQgZm9yIHRoZSBuZXh0IExUUyByZWxlYXNlIGFuZCBtZXJnZQo+ID4g
aXQgaW4gdGhlbi4gVGhpcyBpcyBsb3cgcHJpb3JpdCwgc28gSSdtIGZpbmUgd2l0aCB3YWl0aW5n
Lgo+Cj4gSSByYW4gdGhpcyBieSBQYW9sbyBpbiBsYXN0IHdlZWsncyBQVUNLLCBhbmQgaGUncyBp
biBmYXZvciBvZiB0aGUgcmVuYW1lcyAob3IgYXQKPiBsZWFzdCwgaXMgYS1vayB3aXRoIHVzIGRv
aW5nIGl0KS4gIElmIHlvdSBjYW4gcHJlcCBhIG5ldyB2ZXJzaW9uIGluIHRoZSBuZXh0IHdlZWsK
PiBvciBzbywgd2UgY2FuIGdldCBpdCBhcHBsaWVkIGZvciA3LjEgc2hvcnRseSBhZnRlciB0aGUg
bWVyZ2Ugd2luZG93IGNsb3Nlcy4KCldpbGwgZG8uIEknbGwgdHJ5IHRvIGhhdmUgaXQgb3V0IGJ5
IG5leHQgd2Vlay4gVGhhbmtzIQoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9rdm0tcmlzY3YK
