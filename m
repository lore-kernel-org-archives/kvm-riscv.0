Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB2D606A31A
	for <kvm-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 14:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y9TfBGEQ;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TRFleATB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lnLvDsCQcCp1xbpFyxQVmknF+aLbM3gwjT7XFogyUPQ=; b=Y9TfBGEQiKysDvgYhJjfOT2PYy
	sZ/olYel1K1w04O72aTYV0KclcW/5mfXhu/aGwUSXkUMWlHElnKVLDCJ5OILg+QLdmkfOxk8dQIJP
	JNGbfg+P/j8exmfLmq8LzFUbynO+gLfqJzhmfIDGDPAGkD3glEdP8K7Yq9D2YAACFhvygqYruQj+r
	EZCbuP4yXhuHbKK4l33nfgA9N4ogzQpqwSXxt/AUVhlzcgNsyjcQOjdv9uVYtr1qkGHOgTiNYbCbT
	C4NMy2nHooBi2Hj0bdM7pSrB7E5RkNdF5SKFOTQaHfVbLHB1GBEfTfE0XcbpY609stf6fmxIbcp+P
	USe+PbTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJu9P-0000000ELtv-3eNd;
	Thu, 22 Oct 2026 14:52:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJu9M-0000000ELt1-3W19
	for kvm-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 14:52:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792680731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wqyTtRBZvnyrEsl379QgY7jQoqueXCh5qRvjx+WApRM=;
	b=TRFleATBeicZeLerWJX05YeIRhOOEF/xhAAY88WY9sxHgS0nQSDDY4ykJmqz7r753awC1V
	nUIpbSo8/rJ4al1PlqVsfUAEimaTHPPyuNHgi8NG4E6xe5L5rj0fvls6uBVD2n/OrLIPf6
	v6BTBp3kEzphU+kFEfBt8snLFmv7ugg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-tMIuK4AIPQi-PYfal_11xQ-1; Thu, 22 Oct 2026 10:52:09 -0400
X-MC-Unique: tMIuK4AIPQi-PYfal_11xQ-1
X-Mimecast-MFC-AGG-ID: tMIuK4AIPQi-PYfal_11xQ_1792680728
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48dea677afcso768906f8f.1
        for <kvm-riscv@lists.infradead.org>; Thu, 22 Oct 2026 07:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680728; x=1793285528;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wqyTtRBZvnyrEsl379QgY7jQoqueXCh5qRvjx+WApRM=;
        b=nH2Zx8UdzM8eJNq4KRAWzeKDTm05MM13I5RXpA5GiLKdlUsSoqq2C8gXH5dpyfPyFS
         2HIqW3zQAccwUgA+tsGvQ4ITxGMMzfZKVL4tLDP9E0rBAAc6lVKOOOhqlUVYeMKLy7Fp
         lYrYZxRvQCt0Hw4ovoyLmch/0VCWlko/pExmbAeMvcgy9+ZkJ33fhUj87AEvega0+nVF
         k+ZMhznG6XnkoRCOcpq+c8Ijn7FSGiw1KVavT6mQvXXuwR5eoQBwBj7kSK3sekdyx3hj
         3RPRSP0oYiBtI5L6xzrvI/xe2KhFI7KGh2hyBgEQfKqx0y7iWP9iqVB2sFPU3/Z+uNiT
         382A==
X-Forwarded-Encrypted: i=1; AKwUvByX/sPyjcRhBR6OWigotWMmVfHNan58WglaJleAal61IPIkfFnGMoFkSgHICdRD0iM8oQe9DEWE1Dg=@lists.infradead.org
X-Gm-Message-State: AFq9FYLgsVBWNGZObPAdftTaBJukfxUZtuxo8ZalkmX7F61pjNvRMH2V
	Tv5HXGa5XoPab8aSjbpZtG7l4UDOtB3v05eUie1XvKNwjexhS72x3xr8JA0fd6G4umOsM89RfAn
	nxSHpfO9KoIe1FisAYX0rf7s7QH9xd3iylLSleeUoeAt2DX7YskyGxDtyRp/C+Av9MnuzP6M/DZ
	VX8AEnMzEC2mVq8KRrAuuMxsf8aEfvctIceZ2LfcPPbg==
X-Gm-Gg: AYBFou19s5Q29QNMm0gEOqkmxtiXBQ0fu4sRHSY3C1XCFYFL10LxI7eR4KQR4rO7QSk
	SGNWngDPqKf2so6r3D8RKrQNkpl6hWSaHnJ7cdrjWg0otDB22YJGvfufnOHnOdGDvTQCZSuhBHU
	jKkiyregJwMF3aPg1Ew+67VJd4OEY61NO+CFt+lLOK8GRXdtF4FtP1B8BnSB3pWmsVN00JqhiY0
	n44sBbZS6/tEs7UCRIKJjL6hUNrx6LwPDghng8ItnDtgY7Fars30jwi5gXnqQ==
X-Received: by 2002:a5d:584e:0:b0:488:8347:a110 with SMTP id ffacd0b85a97d-48e2d102cb0mr5941229f8f.7.1792680728039;
        Thu, 22 Oct 2026 07:52:08 -0700 (PDT)
X-Received: by 2002:a5d:584e:0:b0:488:8347:a110 with SMTP id
 ffacd0b85a97d-48e2d102cb0mr5941198f8f.7.1792680727670; Thu, 22 Oct 2026
 07:52:07 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CABgObfaH4-Ud4VR=GC8giDmWGJWS-tvYSmPOs4TtWg2hm4ocqw@mail.gmail.com>
 <36adc119db9b30984c0df4d1846c0f29e4e46c07.1792679974.git.sashal@kernel.org>
In-Reply-To: <36adc119db9b30984c0df4d1846c0f29e4e46c07.1792679974.git.sashal@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 22 Oct 2026 16:51:55 +0200
X-Gm-Features: AclHuK_FNMnKU9XQXzMyqQJBnCAE8EKPJnl7xQPFMv72VXmRnTfH3i81qFyOj9g
Message-ID: <CABgObfYuP+jeOZhZYaUrUX2-z0zWMH2Ch=hdizkzmKHLB6KALw@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: Implement kvm_arch_pre_fault_allowed()
To: Sasha Levin <sashal@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, Mark Brown <broonie@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Marc Zyngier <maz@kernel.org>, Jinyu Tang <jinyu.tang@linux.dev>, 
	Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-next@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 59yUZl0ni9CpylowWFfi-hx-6v1UhILJ4KUVlBaJPeU_1792680728
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_075212_951091_57AF578A 
X-CRM114-Status: GOOD (  11.01  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBPY3QgMjIsIDIwMjYgYXQgNDo0MuKAr1BNIFNhc2hhIExldmluIDxzYXNoYWxAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBDb21taXQgY2FhNjM2MjBmOWUzICgiS1ZNOiBBbGxvdyBhcmNo
aXRlY3R1cmVzIHRvIGRpc2FsbG93IHByZS1mYXVsdCIpCj4gcmVxdWlyZXMgZXZlcnkgYXJjaGl0
ZWN0dXJlIHRoYXQgc2VsZWN0cyBLVk1fR0VORVJJQ19QUkVfRkFVTFRfTUVNT1JZIHRvCj4gaW1w
bGVtZW50IGt2bV9hcmNoX3ByZV9mYXVsdF9hbGxvd2VkKCksIGFuZCB0aGVyZSBpcyBubyBnZW5l
cmljIGRlZmF1bHQuCj4KPiBDb21taXQgZThiMzJlMzc3OTUxICgiS1ZNOiByaXNjdjogSW1wbGVt
ZW50IEtWTV9QUkVfRkFVTFRfTUVNT1JZIikgd2FzCj4gd3JpdHRlbiBiZWZvcmUgdGhhdCBob29r
IGV4aXN0ZWQsIHNvIGl0IHNlbGVjdHMgdGhlIG9wdGlvbiB3aXRob3V0Cj4gaW1wbGVtZW50aW5n
IHRoZSBob29rLiBXaXRoIGJvdGggY29tbWl0cyBpbiB0aGUgc2FtZSB0cmVlLCByaXNjdiBidWls
ZHMKPiB3aXRoIEtWTSBlbmFibGVkIGZhaWwgdG8gbGluazoKPgo+ICAgbGQubGxkOiBlcnJvcjog
dW5kZWZpbmVkIHN5bWJvbDoga3ZtX2FyY2hfcHJlX2ZhdWx0X2FsbG93ZWQKPiAgID4+PiByZWZl
cmVuY2VkIGJ5IGt2bV9tYWluLmMKPiAgID4+PiAgICAgICAgICAgICAgIHZpcnQva3ZtL2t2bV9t
YWluLm86KGt2bV92Y3B1X3ByZV9mYXVsdF9tZW1vcnkpIGluIGFyY2hpdmUgdm1saW51eC5hCj4K
PiBUaGUgcmlzY3YgaW1wbGVtZW50YXRpb24gZG9lcyBub3QgcmVmdXNlIHByZS1mYXVsdGluZyBp
biBhbnkgc3RhdGUsIHNvCj4gcmV0dXJuIDAgdG8ga2VlcCBpdHMgY3VycmVudCBiZWhhdmlvdXIu
Cj4KPiBGaXhlczogZThiMzJlMzc3OTUxICgiS1ZNOiByaXNjdjogSW1wbGVtZW50IEtWTV9QUkVf
RkFVTFRfTUVNT1JZIikKPiBTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5l
bC5vcmc+Cj4gLS0tCj4gUGFvbG8sIHRoaXMgaXMgbmVlZGVkIHdoZW4ga3ZtLXJpc2N2LTcuNC0x
IGlzIG1lcmdlZCBpbnRvIGt2bS9uZXh0Lgo+IEZlZWwgZnJlZSB0byBzcXVhc2ggaXQgaW50byB0
aGUgbWVyZ2UgaW5zdGVhZC4KCll1cCwgZG9uZS4gSXQgd2lsbCBiZSBpbiB0b21vcnJvdydzIGxp
bnV4LW5leHQgdmlhIGt2bS9uZXh0LgoKSSdsbCBzZW5kIHRoZSBSSVNDLVYgUFIgdG8gTGludXMg
bmV4dCB3ZWVrLCBzbyBpZiBoZSBjb21wbGFpbnMgaXQgd2lsbApiZSB0aGVyZSBpbiBrdm0vbmV4
dCByZWFkeSBmb3IgNy41LiA6KQoKUGFvbG8KCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdApr
dm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
