Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DBF606A31B
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 03:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pjBjeUuk;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=EPHNdmTF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4zw8CcEXg+Aj4etdKHtfLCAodjCqxImZ/RjowkeUJOI=; b=pjBjeUuk+e7UA1iirCFsJ+K3yI
	EIhE6naqa7IHnROrTDu4t2pxRGtlgid6MOhSdyjobS4sLOzJ5HLIgCrM/ZjMxFY41v0V3A6mvBRMf
	ZC2o72ibCSPQ87v26jDfzWcv8KO2XvkfRHUEfccQ50QmmPD0PG9qVCuvvZG162qxIfFskUcyg/scO
	rLugdm/jQIoAS27m/BqzrIuVWAzNkFPjTHx8rjCiuSD4xiausEYgFeD5PYnookXF6i5H8dY5WFwkh
	I1xOlfq+uBN3or92URbS+KVxC2ro0ppwqr/1BK3VhTAWN7H5TbnB1ShJVgWCsx03/RGtjB3g2YfLb
	psRjCbVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK6I5-0000000FSPB-1WRJ;
	Fri, 23 Oct 2026 03:50:01 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK6I2-0000000FSNk-0eIV
	for kvm-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 03:49:59 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so597475e9.3
        for <kvm-riscv@lists.infradead.org>; Thu, 22 Oct 2026 20:49:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792727396; cv=none;
        d=google.com; s=arc-20260327;
        b=DHkXWS5Mu40fheTXIsANJ2UeAweqKQD3oC/wKRo1+WDMxxq7I+1ULEb4M0R8jH8jnj
         hzLVEmzXgw4j1ZSyJ8OgXQt5l+ZJLU3xLhEj4ZFVPXRitN+g1o8LdYzBsVoCMhl5zLF1
         szA8XLSLZ2B4lgYdpLt3PrjbkyMB2jWtOM2Qj+03XqWAV88uu0epN/uBbYxQcuepqlQw
         Pe/+8v7WsgIq9p5ogj/YbS8Lfh+fK/u57j7QDKaGsBkaXv/iOqrWKTL+dET4HoZSINAD
         mW9/quHzUDyf6b2hWO9/fgbOzq7+KAa2jg8oBMY+4Gx482sRp9yCo3/1UgQqTp/j+e3t
         7/5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e8SruC8g2rwvdIhh7oEO3GCo3RXeoIg5jF9AOnzr/wQ=;
        fh=sajs0YfhwtrjIF+upNFbHzSPxcN+5oU7xRUhjdf/P68=;
        b=VY2JpbIiz21xuthSYExxcf7nP33QsfA+b5uKhreBQGuAQLvO3wv4wfaHGtFJUGesi1
         a/TE7en3Ii203kzSB6TTAFSjCtvN6yTp4bQ2x53baVhXVvzhJO89gIh7jpx+Hty1QPRG
         75cZZcQ9gT3FCoFqq6a0eLE/lAqXYNgL7/oNoqkDsPR9BXIaGXumKFcJBITuZw+0M8+S
         +u2nzGszerlckbIFjmH3w+DYf11a8VKOOlExKdrx5g8fAwlnD1byQeiFeZHEjXqh2VuH
         7u6bbckWAeaaQmVB7383ozQOC3/SUp4X1SCfQTmIrxlSMxZYrmmtaN4DEoJOJmrzEk1a
         KENA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792727396; x=1793332196; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e8SruC8g2rwvdIhh7oEO3GCo3RXeoIg5jF9AOnzr/wQ=;
        b=EPHNdmTFHWaE/OypCx1vXsosPRmYYfUEi1rRYdI/e/MlhI5aP6QrpT+1vLnF+x4h2p
         mw4YlG65f6pXmz4q7ylR+yGPu6nMxHAzbLmXAe8rWoO/PQUS90s4CpyPpOXq22x/psnE
         iJNRj6QeY7Wo17IYDBDzaC6D//tYZcjqy6BUZcYoodHimEFkI6b9Y43ABY4hB6lWOsXD
         pVmt00IkGoSmBTM7erKGN5haraEMk6ByLXc+Uqlo42MNPvH3gjw4Gtj34jm/0KVtgm80
         QO3utz95XG46I5jB9EiwV3It3ns2gOLSFldZXetrZacAJPFZ2fWmsqYqRg0ISIR2Ca/Q
         T8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792727396; x=1793332196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e8SruC8g2rwvdIhh7oEO3GCo3RXeoIg5jF9AOnzr/wQ=;
        b=M41C/NW1v2oVlSyxiFmENpYXcDSKv6wOWHNI5Dihn4lxjMxoN8/Lgsl/B/RbNu29AV
         FXiVvefwe00uEk1C48WDQtAGNHEuCRha0GbqGTvgmALoWMmOtGtIcNiTueWy24s31cWA
         WOJu3yfMvpfTAUqS629Z2qZY7Izv4J9wAv8rg6z5rVcSVyHxzAdhi1qBKSUQmqxAmeUf
         5ZrEWNOsfqaUzn22ToKEDz03tVyGhsbVRyOm9mRoGNI87bfbR5Y1eSHHf0vwXKETqvwn
         AecdKnm9oxMG/O0CSPCSkf6ZlFBUW8zbYYIZbMBuVNsIP16g9Zqua1iAGiGd6EQ+RH6b
         kOhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLVtR+ZQLcIqK8n15H6alghwzH85Febs1DRVqIyarxIUUgteVexAdSBpDklxg4ClMjcuPECdRd62I=@lists.infradead.org
X-Gm-Message-State: AFq9FYIrFhtV8IwSV/Z7wmykVk6ynIpYUSpB8x9dzTzGo0kJKFhkHWZ5
	PslWkCqpGx6pSX3el+uIhWvOeVfxppY8GrGM0VkDgEPDpbxGIICpDpMV/YlbuHG9t2SVZ9ROIph
	wB204H7YsMlvBQ6fXD5Sn625QEVW6x5FBJGkxJr2m4w==
X-Gm-Gg: AYBFou2mKdSv6lK8Lu04aLDxIS2vypwNE5lRh7mwAvYPYrzsZHU/4Ww07Z20UtQC31h
	O9Q7rB2R98eLPu+WOO9oQE1/7GUcTmoVVatMU4apkm70hiTvcBVLxXGsBs4bdIC718pgIoigZ/n
	5F8ZmLG9WzOwh7HQXLE9NBN9RA10TFupEzEAlKrCGlsXS+5Ul3a4+/ggG4y+PGnBHIV5qQUZYR/
	Sd6xucAVAH5jmZWz70NDm9rcYnnvLVVEujyZNGbxzzBLQI/ZXq8GJS8czrl1h/br90O7sVPuq/n
	OaiOBJCoKWlIBjYSEsTgjXSCmvuZ+0qJtYcxefCZ5zDc+zJZ+ole9R3pmBNaDooPCqKkrAvudWt
	TJnLrsv4SoLbas5MKGfrFJAJPVW9iywrjlk4ZXkR1kftkvlPLhoFj0njD75bd6/BsjkRPRJ8D8i
	1/IpMZHVxepD3VeX+U/tgq6mwxtrnrRhZSe6iKxi6hizE5AfWzlbW9Mj0=
X-Received: by 2002:a05:600c:a45:b0:4a1:fae2:a8ab with SMTP id
 5b1f17b1804b1-4a211c78b0fmr14407705e9.3.1792727395607; Thu, 22 Oct 2026
 20:49:55 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CAAhSdy1zNA7Xn9Uv1fFTRJMuCP0Pd2xLQazzm2FedTo_DZwMCA@mail.gmail.com>
 <CABgObfaH4-Ud4VR=GC8giDmWGJWS-tvYSmPOs4TtWg2hm4ocqw@mail.gmail.com>
In-Reply-To: <CABgObfaH4-Ud4VR=GC8giDmWGJWS-tvYSmPOs4TtWg2hm4ocqw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Oct 2026 09:19:44 +0530
X-Gm-Features: AclHuK-CvaYfVDOqEfQN7aLUZ5bdjR2uJDsmHLdPAvhCz9ZB6h-rXHKmpRHIUtw
Message-ID: <CAAhSdy15rF2Hj8Zph7n61tfW79iSPe8mvLpy+eQRcyvAC0TZCA@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 7.4
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Atish Patra <atish.patra@linux.dev>, 
	"KVM RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_204958_214197_030DFD72 
X-CRM114-Status: GOOD (  17.24  )
X-Spam-Score: -2.1 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBPY3QgMjIsIDIwMjYgYXQgNjozNuKAr1BNIFBhb2xvIEJvbnppbmkgPHBib256aW5p
QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBPY3QgMjIsIDIwMjYgYXQgMjo1MeKAr1BN
IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+IHdyb3RlOgo+ID4KPiA+IEhpIFBhb2xv
LAo+ID4KPiA+IEkgd2FzIG9uIHZhY2F0aW9uIGxhc3Qgd2VlazsgaGVuY2UsIEkgYW0gc2VuZGlu
Zwo+ID4gdGhlIEtWTSBSSVNDLVYgNy40IFBSIGEgYml0IGxhdGUuIEFwb2xvZ2llcyBmb3IKPiA+
IHRoZSBpbmNvbnZlbmllbmNlLgo+Cj4gVGhlIHByb2JsZW0gaXMgbm90IHRoZSBQUiwgaXQncyB0
aGF0ICpub25lKiBvZiB0aGVzZSBjaGFuZ2VzIHdlcmUgaW4KPiBsaW51eC1uZXh0IHVudGlsIHll
c3RlcmRheS4gIFRoaXMgaXMgbm90IHRoZSBmaXJzdCB0aW1lIHRoYXQgSSBub3RpY2UKPiB0aGlz
IGFuZCByZW1pbmQgeW91IG9mIGl0Li4uCj4KPiBUaGVzZSBhcmUgODAlIGJ1Z2ZpeGVzIG9yIG90
aGVyd2lzZSBub3QgbmV3IGZlYXR1cmVzIChlLmcuIDMvNC81LzYgaW4KPiB0aGUgbGlzdCBiZWxv
dyB3b3VsZCBiZSBmaW5lIGV2ZW4gZm9yIC1yY04pLCBzbyBJJ2xsIHB1bGwKPiBuZXZlcnRoZWxl
c3MuIEJ1dCAqcGxlYXNlKiB0cnkgdG8gY29tbWl0IHN0dWZmIGFzIHNvb24gYXMgaXQncyByZWFk
eSEKCkkgZ2VuZXJhbGx5IHVwZGF0ZSByaXNjdl9rdm1fbmV4dCBicmFuY2ggbXVjaCBlYXJsaWVy
IGJlZm9yZQptZXJnZSB3aW5kb3cgYnV0IHRoaXMgdGltZSBJIG1pc3NlZC4gR29pbmcgZm9yd2Fy
ZCwgSSB3aWxsIGVuc3VyZQpyaXNjdl9rdm1fbmV4dCBicmFuY2ggaXMgdXBkYXRlZCBzb29uZXIu
CgpUaGFua3MsCkFudXAKCgo+Cj4gUGFvbG8KPgo+ID4KPiA+IFdlIGhhdmUgdGhlIGZvbGxvd2lu
ZyBLVk0gUklTQy1WIGNoYW5nZXMgZm9yIDcuNDoKPiA+IDEpIExhenkgVi1leHRlbnNpb24gZW5h
YmxlbWVudCBmb3IgS1ZNIHNlbGZ0ZXN0cwo+ID4gMikgSW1wbGVtZW50IEtWTV9QUkVfRkFVTFRf
TUVNT1JZIGlvY3RsKCkgYW5kIGVuYWJsZSBjb3JyZXNwb25kaW5nIEtWTSBzZWxmdGVzdHMKPiA+
IDMpIFNob3cgc2VwYy9zY2F1c2Uvc3R2YWwgQ1NScyBpbiBLVk0gc2VsZnRlc3RzIHZjcHUgZHVt
cAo+ID4gNCkgVXNlIGEgcmF3IGxvY2sgZm9yIElNU0lDIHdha2V1cCBzdGF0ZQo+ID4gNSkgUmVq
ZWN0IHZDUFUgY3JlYXRpb24gYWZ0ZXIgQUlBIGluaXRpYWxpemF0aW9uCj4gPiA2KSBVcGRhdGVk
IG5leHQgYnJhbmNoIG5hbWUgaW4gS1ZNL3Jpc2N2IE1BSU5UQUlORVJTIGVudHJ5Cj4gPiA3KSBB
bGxvdyBaaWNjbHNtLCBaaWNjYW1vYSwgWmljY2lmLCBaYTY0cnMgZm9yIEtWTSBndWVzdAo+ID4K
PiA+IEluIGFkZGl0aW9uIHRvIHRoZSBhYm92ZSwgd2UgYWxzbyBoYXZlIHRoZSBmb2xsb3dpbmcg
Zml4ZXMKPiA+IGFuZCBtaW5vciBpbXByb3ZlbWVudHM6Cj4gPiAxKSBBdm9pZCByZWR1bmRhbnQg
aW50ZXJydXB0IGNoZWNrIGZvciBwZW5kaW5nIHRpbWVycwo+ID4gMikgRml4IGJ1aWxkIHdpdGgg
dmVjdG9yIHN1cHBvcnQgZGlzYWJsZWQKPiA+IDMpIEZpeCBJUEkgZGVsaXZlcnkgZm9yIG91dC1v
Zi1vcmRlciB2Y3B1X2lkCj4gPiA0KSBSZXBsYWNlIGltc2ljIHN3aXRjaC1jYXNlIG1hY3JvcyB3
aXRoIHJhbmdlIGNoZWNrcwo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2t2bS1yaXNjdgo=
