Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF1FC3ABC0
	for <kvm-riscv@archiver.kernel.org>; Thu,  8 May 2025 14:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dlSC8dqeszllXPm0ThmXEr0xNomHgiYBGpjL+iW9K/w=; b=yuT1EKxcjM3mO0
	MmdFY4QMBKZXO3Z078JzCHaYqv2N466K6Wyqxwy8PqglVB8il+tMcDr9HVmfjMWlO0T32RdjEDQqN
	t9x1MY8e9YLLA7BB+CjjQ5Oo4G/X5KAl4Bh7MKRc3IZ4eRekC8/LsOLIkIBBU7tsM77sT/aZFHsxh
	av9ILICAh9j2fyeTipgSfcJAnpoV4emMSdGu5xltbqhLzRzx/0/VPoEzFZMgrIMF3pa2VfyL/epoC
	n6dFvwT6SzLqg8f/g1e1IjZr9//ZjIEYuf6TbLKuBfPdjO4/QHxkSCoAdD5XLaYA/SbKYHA2cj0mj
	666t6OjJRlT6MmWdQkfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2JL-00000000wLE-0noH;
	Thu, 08 May 2025 14:33:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1Yl-00000000nkN-1OX1
	for kvm-riscv@bombadil.infradead.org;
	Thu, 08 May 2025 13:45:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ddvWwlvmJ56gF3G0LSGRAILthDv6fgZpldIeC6gbgK4=; b=YhNsRtt+6o88AnR0HtWJef3GYw
	Jm1opj+E/MbZESd+ALVicP501npOJQ5DaHrJCzW1FqdHtDfgSdMUgSrqJ+XlPXC6hf5yVP6/WUl0d
	vj0B/hC5pVc8Ev14ZqEYgQQ4Ds/o4gn0ZOE6jlaqMvHpor0mBdgcisLqu3lOL6j2VsIfOHQgmnguG
	y0VFxOt+x5NnhNL6fme5XvQst5NNoRPuw0OsJRysxnaPoYdgX+O6qUKl+JlpimQL2m3drM2a72mS1
	nIVTaSGVj/21t1jetdyHe3AQ/Zi+zV48ATi9xLGcU+IBnC3pjheNxruJunGKnc4HrO3N09Czem4hZ
	sPiBlTJA==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uD1Yi-0000000G4RR-1ceq
	for kvm-riscv@lists.infradead.org;
	Thu, 08 May 2025 13:45:10 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a0b77ea855so155236f8f.3
        for <kvm-riscv@lists.infradead.org>; Thu, 08 May 2025 06:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746711905; x=1747316705; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ddvWwlvmJ56gF3G0LSGRAILthDv6fgZpldIeC6gbgK4=;
        b=ow6TcuHH5rCm9BSfautDzfd4B5p76kq0L/agQo1hjR5wk9PVT9u4z28bwV3e1dfuwE
         q9PzNPA7AfKaI8JOih90V4DW1XauQJ3hjAoB3qBBfWa/C2N8/GOCFJbn/FQAb9BQ0u9g
         9ZeRT3jYndLaIvmjnpWjTKv6DdeglfnelQC01OyqNiFnF2nOILBys6IPr7OTUKAoCKh6
         sQMpqloE/YAu67M30EY50N1ayS4uvVJriF+RyVjBCL3s0uDez3rM25fmYCBRWzs6kq/c
         8KfGdMIT/DWPqmwCX1Qbthh/7bRWLkYPbd/5RWNUEdC74cnL2G0zBqX55/s64RI1aRB8
         PDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746711905; x=1747316705;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ddvWwlvmJ56gF3G0LSGRAILthDv6fgZpldIeC6gbgK4=;
        b=rG3Eng/S8lJ4wALghbwDummkhmOZmkp59HYPSjKXIBxQQ5ul/tmDpSuzu9JjKucj/C
         4Is9KyY5+vrOwcLGFeDsFYLyZa+VazLzRabmaznmO9SQavQKnxjuVoJ2CJ3s3M0b7F4i
         Bif03fYHDdZOtkGJvKa1Y4AsZ9VQvhQ+XAD+0iICCP75ve4+uqSsOmZ+x1wffYHKbh/O
         iVarDDxDs9sX1b+/YfOzi8PeBUaI27af6wKzf/ZHYY9b0WZooSiHBtQV4FlVNsvGjpf3
         jlMW0K8tGt2KBlKW3sEHOSK4KgVrJsrUUEpBS1vewbxlXIb3ebKJWDSWnsQ4BZNCXmML
         ch1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXDgSFMrlJmBy6ow9Ztb19gbYGy4BONVfmA9UxWiVSbWsUNCg61skGOBAETPWss5gT3yz0Diuw0lgk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+oicenetUrlOiBPHPKZljsTg1XRHiqV2xzuUswehfux/yKtlP
	Cfmnwuo/ZerSdCYCN35gJyH/hrllplpk+hQpE56GBYtvJxxHsA11pZdE/qd+6Gs=
X-Gm-Gg: ASbGncsSKs8dMuwfJkGTn8mwXiv/kba4fIIC5BKzpHHAbfyrqvOR3Buwob2HrqoeDjy
	ucgLY9COP9x8bNFgr2AM1EEbYFylSQ45e2Ya6WGN2o7uaf/QLuG4484N1/FRxDy+70lIw2UZQ36
	eh0wEi/JuTSpEmddsNqnfjBbkJn1h7IYFxvw/voDuGjwcRVAsWag/4NuxW3WvSLwJoPL9OjhmR4
	Gg+AjLu8ZPfN4mcHbwWZPPBpjt86z3NilALvBwr25u5ExNVq8HtXPSY/E5UrxdJTCw7N3m5jjXP
	fwsZYDR1mPhJ/EtYXj12GNAx1LH3s41K2VBkmCOiLOfZerAM9wqsr++gzXQ=
X-Google-Smtp-Source: AGHT+IFF1lCrGjkOjvYLS8FuS71T+NJYPZUDl1ROqgtA2qAAckMb6oaYDMoD6JX8fEG+cSaT0+BVjg==
X-Received: by 2002:a05:6000:178e:b0:3a1:3543:a74a with SMTP id ffacd0b85a97d-3a13543abcdmr434102f8f.7.1746711905310;
        Thu, 08 May 2025 06:45:05 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:a451:a252:64ea:9a0e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ebe00sm26063f8f.38.2025.05.08.06.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:45:03 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 08 May 2025 15:45:03 +0200
Message-Id: <D9QTOYMN362W.398FE9SQB0S4X@ventanamicro.com>
Subject: Re: [PATCH 0/5] Enable hstateen bits lazily for the KVM RISC-V
 Guests
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Atish Patra" <atish.patra@linux.dev>, "Anup Patel"
 <anup@brainfault.org>, "Atish Patra" <atishp@atishpatra.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Alexandre Ghiti" <alex@ghiti.fr>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com> <D9OYWFEXSA55.OUUXFPIGGBZV@ventanamicro.com> <bc0f1273-d596-47dd-bcc6-be9894157828@linux.dev> <D9Q05T702L8Y.3UTLG7VXIFXOK@ventanamicro.com> <ec73105c-f359-4156-8285-b471e3521378@linux.dev>
In-Reply-To: <ec73105c-f359-4156-8285-b471e3521378@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_144508_535268_C02515FE 
X-CRM114-Status: GOOD (  17.99  )
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

MjAyNS0wNS0wN1QxNzozNDozOC0wNzowMCwgQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQGxpbnV4
LmRldj46Cj4gT24gNS83LzI1IDc6MzYgQU0sIFJhZGltIEtyxI1tw6HFmSB3cm90ZToKPj4gMjAy
NS0wNS0wNlQxMToyNDo0MS0wNzowMCwgQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQGxpbnV4LmRl
dj46Cj4+PiBPbiA1LzYvMjUgMjoyNCBBTSwgUmFkaW0gS3LEjW3DocWZIHdyb3RlOgo+Pj4+IDIw
MjUtMDUtMDVUMTQ6Mzk6MjUtMDc6MDAsIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29t
PjoKPj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBUaGlzIHNlcmllcyBleHRlbmRzCj4+Pj4+IHRob3NlIHRvIGVuYWJsZSB0byBjb3JyZXBz
b25kaW5nIGhzdGF0ZWVuIGJpdHMgaW4gUEFUQ0gxLiBUaGUgcmVtYWluaW5nCj4+Pj4+IHBhdGNo
ZXMgYWRkcyBsYXp5IGVuYWJsaW5nIHN1cHBvcnQgb2YgdGhlIG90aGVyIGJpdHMuCj4+Pj4gVGhl
IElTQSBoYXMgYSBwZWN1bGlhciBkZXNpZ24gZm9yIGhzdGF0ZWVuL3NzdGF0ZWVuIGludGVyYWN0
aW9uOgo+Pj4+Cj4+Pj4gICAgIEZvciBldmVyeSBiaXQgaW4gYW4gaHN0YXRlZW4gQ1NSIHRoYXQg
aXMgemVybyAod2hldGhlciByZWFkLW9ubHkgemVybwo+Pj4+ICAgICBvciBzZXQgdG8gemVybyks
IHRoZSBzYW1lIGJpdCBhcHBlYXJzIGFzIHJlYWQtb25seSB6ZXJvIGluIHNzdGF0ZWVuCj4+Pj4g
ICAgIHdoZW4gYWNjZXNzZWQgaW4gVlMtbW9kZS4KPj4+IENvcnJlY3QuCj4+Pgo+Pj4+IFRoaXMg
bWVhbnMgd2UgbXVzdCBjbGVhciBiaXQgNjMgaW4gaHN0YXRlZW4gYW5kIHRyYXAgb24gc3N0YXRl
ZW4KPj4+PiBhY2Nlc3NlcyBpZiBhbnkgb2YgdGhlIHNzdGF0ZWVuIGJpdHMgYXJlIG5vdCBzdXBw
b3NlZCB0byBiZSByZWFkLW9ubHkgMAo+Pj4+IHRvIHRoZSBndWVzdCB3aGlsZSB0aGUgaHlwZXJ2
aXNvciB3YW50cyB0byBoYXZlIHRoZW0gYXMgMC4KPj4+IEN1cnJlbnRseSwgdGhlcmUgYXJlIHR3
byBiaXRzIGluIHNzdGF0ZWVuLiBGQ1NSIGFuZCBaVlQgd2hpY2ggYXJlIG5vdAo+Pj4gdXNlZCBh
bnl3aGVyZSBpbiBvcGVuc2JpL0xpbnV4L0tWTSBzdGFjay4KPj4gVHJ1ZSwgSSBndWVzcyB3ZSBj
YW4ganVzdCBtYWtlIHN1cmUgdGhlIGN1cnJlbnQgY29kZSBjYW4ndCBieSBtaXN0YWtlCj4+IGxh
emlseSBlbmFibGUgYW55IG9mIHRoZSBib3R0b20gMzIgaHN0YXRlZW4gYml0cyBhbmQgaGFuZGxl
IHRoZSBjYXNlCj4+IHByb3Blcmx5IGxhdGVyLgo+Cj4gSSBjYW4gdXBkYXRlIHRoZSBjb3ZlciBs
ZXR0ZXIgYW5kIGxlYXZlIGEgY29tbWVudCBhYm91dCB0aGF0Lgo+Cj4gRG8geW91IHdhbnQgYSBh
ZGRpdGlvbmFsIGNoZWNrIGluIHNzdGF0ZWVuIAo+IHRyYXAoa3ZtX3Jpc2N2X3ZjcHVfaHN0YXRl
ZW5fZW5hYmxlX3N0YXRlZW4pCj4gdG8gbWFrZSBzdXJlIHRoYXQgdGhlIG5ldyB2YWx1ZSBkb2Vz
bid0IGhhdmUgYW55IGJpdHMgc2V0IHRoYXQgaXMgbm90IAo+IHBlcm1pdHRlZCBieSB0aGUgaHlw
ZXJ2aXNvciA/CgpJIHdhbnRlZCB0byBwcmV2ZW50IGt2bV9yaXNjdl92Y3B1X2hzdGF0ZWVuX2xh
enlfZW5hYmxlKCkgZnJvbSBiZWluZwphYmxlIHRvIG1vZGlmeSB0aGUgYm90dG9tIDMyIGJpdHMs
IGJlY2F1c2UgdGhleSBhcmUgZ3Vlc3QtdmlzaWJsZSBhbmQKS1ZNIGRvZXMgbm90IGhhbmRsZSB0
aGVtIGNvcnJlY3RseSAtLSBpdCdzIGFuIGludGVybmFsIEtWTSBlcnJvciB0aGF0CnNob3VsZCBi
ZSBtYWRlIG9idmlvdXMgdG8gZnV0dXJlIHByb2dyYW1tZXJzLgoKPj4+IEluIGNhc2UsIHdlIG5l
ZWQgdG8gZW5hYmxlIG9uZSBvZiB0aGUgYml0cyBpbiB0aGUgZnV0dXJlLCBkb2VzIGh5cGV2aXNv
cgo+Pj4gbmVlZCB0byB0cmFwIGV2ZXJ5IHNzdGF0ZWVuIGFjY2VzcyA/Cj4+IFdlIG5lZWQgdG8g
dHJhcCBzc3RhdGVlbiBhY2Nlc3NlcyBpZiB0aGUgZ3Vlc3QgaXMgc3VwcG9zZWQgdG8gYmUgYWJs
ZSB0bwo+PiBjb250cm9sIGEgYml0IGluIHNzdGF0ZWVuLCBidXQgdGhlIGh5cGVydmlzb3Igd2Fu
dHMgdG8gbGF6aWx5IGVuYWJsZQo+PiB0aGF0IGZlYXR1cmUgYW5kIHNldHMgMCBpbiBoc3RhdGVl
biB1bnRpbCB0aGUgZmlyc3QgdHJhcC4KPiBZZXMuIFRoYXQncyB3aGF0IFBBVENIIDQgaW4gdGhp
cyBzZXJpZXMgZG9lcy4KCkkgd2FzIHRoaW5raW5nIGFib3V0IHRoZSBjb3JyZWN0IGVtdWxhdGlv
bi4KCmUuZy4gZ3Vlc3Qgc2V0cyBzc3RhdGVlbiBiaXQgWCB0byAxLCBidXQgS1ZNIHdhbnRzIHRv
IGhhbmRsZSB0aGUgZmVhdHVyZQpYIGxhemlseSwgd2hpY2ggbWVhbnMgdGhhdCBoc3RhdGVlbiBi
aXQgWCBpcyAwLgpoc3RhdGVlbiBiaXQgU0UwIG11c3QgYmUgMCBpbiB0aGF0IGNhc2UsIGJlY2F1
c2UgS1ZNIG11c3QgdHJhcCB0aGUgZ3Vlc3QKYWNjZXNzIHRvIGJpdCBYIGFuZCBwcm9wZXJseSBl
bXVsYXRlIGl0LgpXaGVuIHRoZSBndWVzdCBhY2Nlc3NlcyBhIGZlYXR1cmUgY29udHJvbGxlZCBi
eSBzc3RhdGVlbiBiaXQgWCwgS1ZNIHdpbGwKbGF6aWx5IGVuYWJsZSB0aGUgZmVhdHVyZSBhbmQg
dGhlbiBzZXQgc3N0YXRlZW4gYW5kIGhzdGF0ZWVuIGJpdCBYLgoKLS0gCmt2bS1yaXNjdiBtYWls
aW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
