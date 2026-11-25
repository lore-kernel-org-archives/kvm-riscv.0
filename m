Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3ED606A32E
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 05:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SR1I2PqD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=vKmbRd2z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=a7pTxdT/esFWi8CWBu4uPJKK7ky8c7vEFJCMoR0+w1o=; b=SR1I2PqDDjqv2aUMMQt6QEqPm8
	DwNmQBMUyaS6eOGmvF9DOl8kkjrRJ6pL8o9T+oReXvbzm1u7vmoiDJatbuma5SRTli7KOS9SRX8Jv
	Ko7UyHVLNZlhadu8hc4UwU2qJnGqY1IEiAB3BxwzMx0vnBXc9JlRwRThyzE7XquhkPgO3zjRZlMGC
	LSwyjk9JdI/HuNdBoHmHPFAfjWwdfipKNKmVOZcY5ZBKfyfiyit22Bcxrz4RP7kZady8ox+XldmvW
	ezPuh9nSeaJDkcxmLEE1zYpMfJrMGI42E+PmBha94+OUlxaBJYGbEiVdFAUkTWzuZEgKNkOfOSC0M
	hEfGt6ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW5tn-00000008UVs-02fZ;
	Wed, 25 Nov 2026 05:50:31 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW5tj-00000008UTC-3KcZ
	for kvm-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 05:50:28 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so4054012f8f.0
        for <kvm-riscv@lists.infradead.org>; Tue, 24 Nov 2026 21:50:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795585826; cv=none;
        d=google.com; s=arc-20260327;
        b=C7RQohveGfTJS+TsVlxoAruXIi1GUj4QzZh3nZUjP+4vHGIk6ZigBSoo7gXnSt5tyP
         m7EBNQccxTow/uShJfCT13/QTVze7PvGj0TsPDcfdmyaNWLVmiREUV2VKLJtIzFTiWQ+
         l09qsLJSXLqT+INSnLx9wM2ApJeRB+xNf/h03I3LbrNwLzAF3FWnxR8rgPq+adWLVFOR
         XAA6QPSm1C/s4fZJVy0ByGi6hEtLnMmUpxVcFr1UgmsypMTOxLpD72Ttb6syPqt3WWrU
         QSAINYiA9aLCSsBuJSgmYm+xtiGkkyjCyt/pHD1JScAkGvZtrvspKfo1QL27jlxkx//5
         8h6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h0QzRh8muxydOHGjX2h5cehhw+NrrMdYMgJiE84UVD4=;
        fh=NIlvGKHGBGKRwH/PA9T85CFYmD4vhti5AG2fxIepHkE=;
        b=rBZBuvFKFkmduAMWhEMa9leEOeJOT4OoQuu6Z3DGLzwY49+vH0SL2jg8g7L1hiQSOq
         evNo0fW57AJBsEKcUyseM1Yt1wZxNaJx3x9imv4NqGMP69NnhzO5ibtB3Pv0o7XtLW58
         6GbDDXcS0mfCi+RD9wxjmffzBaXs3lJ2joLMMj3Qh7Y67QPXkOl/IkPfBMG/FKDq73kc
         lBaWbs3eVbX+QR0xdL8obKHCIzshaqtBoRDa29XDs1PWu10zfA8hUscTHUEFTdcMvzIN
         1uF+EOjJZihxcRH4lZid+EnF+K70GnBVC2Dtdv6JJk2qhwK1PHz+tUZS5rTFHpMmhhTP
         rd4w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795585826; x=1796190626; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h0QzRh8muxydOHGjX2h5cehhw+NrrMdYMgJiE84UVD4=;
        b=vKmbRd2zuEOcZToO6E9Ed0YL9CZt+uZwh7JgLAHEm+wYquneeOrQuafQRskLagaQ+y
         /i3OyKg41MHy7HkPU8SpQ7ReGg2lEYgBHDNi6zOJe0hS7QSjo2px2xZbTsh8doygUTC7
         oXZ6iVElRNQESyivoKuLSD7P5fUBjDQz3bUMP36F+uzafEdGfexHnf7clArydla7IJ5T
         3yyBmr9WuU1Zn1zYgfgkp9TO1sykIFGXMCrtv2yCKrk5rUIvMzRVhGIYoc4onOsGlg6V
         8syKcb88bWbZ76zfO4IdkY9EvmpAjV/RltM4affYf9Rrsg/FaERdzXpJ0gn3u5ZOwkt1
         ks9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585826; x=1796190626;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h0QzRh8muxydOHGjX2h5cehhw+NrrMdYMgJiE84UVD4=;
        b=xu4RUNCtwz1nku9SD5+a4qjgRYPBo4sq3fHG3pa/t9AyeXeI5DXbtVLPkPkl3hQOr3
         B//jYvLdPBChiuvbMt2JEFsqqz37sUe2nbD5mZ7rWIpir3VN4ODAa8sPLaNVtbj5EgB3
         N6ytB5O1NkSi81OPAIUQJ2DpFoAZLQOEzgleVd59L4ntGCG8u9BJ7E+qSpWyA/sM1CtD
         L26JvgIbATkiVNVM1rVV+tYV4DbF/2WLr5Ds5euXUlurMmZM0WACy3K0bxhf+8YTVTwb
         d8a0ZuQaVE7QouwBipx8QAnRvwMyRf4GfVx1SxJmcuHYl3/IgJpaQEp0MyD7bE8GoSqs
         D/nw==
X-Forwarded-Encrypted: i=1; AL+hErFjl242freyZQjdQPicDjMQ5ZUfkCsprHzDY9iibbYdRngPJrbBB4t+djN/N9M/liQi0CmlAvY/15s=@lists.infradead.org
X-Gm-Message-State: APuU4Z9DqQ8BXuvfIepRSOZpsE0L6IpnLbUxRcn/2J68IgmG/l8Gu1l8
	VKBZzyuZZPUXvdICKUJiQyF0ShbkEcRL0Hq1vhNgJfL0XAYEVZGUCxJSMkzUD/0gtSG81LUckKM
	cWQNeC6UoBWeLWLJacLhBnzp49Q7OhiAYvS77jOjbzw==
X-Gm-Gg: AZFdTZdEYEMK8oIHtIDYGB43jzGNABnzwckk1vg48bbR4t2mOVOReCefdbzLN5Np1Hp
	Q9OBhxECXPQyHyEFw7BVim7bdKGIBY9RdNWHMWkHC+NLoFbdtWIgYGEPqX1aDqUDxGV33fmQsAi
	MargH4bol/PV0vKwR80oqvrhgIlZp+6VQ0Rt2q+P03vHkRUKeDZIMxuUvuYzd/4QYWpkdncsFSS
	afFXt5dT3AsTfZEw9iiZf6qDZ5ICNM86mxHOO09jz9W/2HXyxCTBgBmBHGa8dC1yNhcZR72HuQX
	m1Fqb0pahKzppF713Z3e5VkOyR+hXoq1pEcRBaX5V1lBxHcVoHJ2TAlIjQCH2wnH7m2gQSQwXpP
	usGkgZx/bV6xQT7pxKN3SVFfm6qVMLNFsgoZZaFCGv6xLtra3LtDgrreNSd6p9wkdiO3gVYbhAc
	O95/bgSF7gqn5l2NxTj1YhSKpo863ecsUkrPnZ3xsDRhvL53lhMLuMsUE=
X-Received: by 2002:adf:e00f:0:20b0:48e:932:aefa with SMTP id
 ffacd0b85a97d-4abb27268e7mr22701177f8f.26.1795585826178; Tue, 24 Nov 2026
 21:50:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260921111402.120911-1-suunj1331@gmail.com> <20260921111402.120911-6-suunj1331@gmail.com>
In-Reply-To: <20260921111402.120911-6-suunj1331@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 25 Nov 2026 11:20:14 +0530
X-Gm-Features: Aa3M54oFEe_Kg5fzllo_hPF_KMY1sHlitMVjRaBnJClbHNybVQLzGtgAKkyplS4
Message-ID: <CAAhSdy3-0fHHE2tpRRimhOTUWrN01Ju8Mdt4=R1UUp1atwsifA@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] KVM: riscv: Age G-stage PTEs locklessly
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Jinyu Tang <tjytimi@163.com>, 
	Wang Yechao <wang.yechao255@zte.com.cn>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_215027_855884_CFA662E7 
X-CRM114-Status: GOOD (  13.36  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBTZXAgMjEsIDIwMjYgYXQgNDo0NOKAr1BNIFNldW5nSnUgQ2hlb24gPHN1dW5qMTMz
MUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQWdpbmcgRy1zdGFnZSBQVEVzIGN1cnJlbnRseSBydW5z
IHdpdGggbW11X2xvY2sgaGVsZCBmb3Igd3JpdGUsIHRha2VuCj4gYnkgdGhlIGNvbW1vbiBNTVUg
bm90aWZpZXIgY29kZS4gV2hlbiBNR0xSVSBvciBrc3dhcGQgYWdlcyBhIGxhcmdlCj4gcmFuZ2Us
IGV2ZXJ5IHZDUFUgdGFraW5nIGEgRy1zdGFnZSBmYXVsdCBibG9ja3Mgb24gdGhlIGxvY2ssIGFu
ZCB0aGUKPiBkaXJ0eS1sb2dnaW5nIHJlYWQtc2lkZSBmYXN0IHBhdGggYmxvY2tzIGJlaGluZCBh
Z2luZyBhcyB3ZWxsLgo+Cj4gVGhlIHByZWNlZGluZyBwYXRjaGVzIHByZXBhcmUgRy1zdGFnZSBw
YWdlLXRhYmxlIHdhbGtzIGZvciBsb2NrbGVzcwo+IGFnaW5nIGJ5IHVzaW5nIGNvbnNpc3RlbnQg
UFRFIHNuYXBzaG90cywgcHJlc2VydmluZyBjb25jdXJyZW50Cj4gQWNjZXNzZWQtYml0IHVwZGF0
ZXMsIGFuZCBkZWZlcnJpbmcgcGFnZS10YWJsZSBmcmVlcyB3aXRoIFJDVS4KPgo+IFNlbGVjdCBL
Vk1fTU1VX0xPQ0tMRVNTX0FHSU5HIHNvIHRoZSBjb21tb24gY29kZSBubyBsb25nZXIgdGFrZXMK
PiBtbXVfbG9jayBmb3IgYWdpbmcsIGFuZCBwcm90ZWN0IHRoZSBHLXN0YWdlIHdhbGsgd2l0aCBh
biBSQ1UgcmVhZC1zaWRlCj4gY3JpdGljYWwgc2VjdGlvbi4KPgo+IFJlYWQgdGhlIHJvb3QgaW5z
aWRlIHRoZSBSQ1UgcmVhZC1zaWRlIGNyaXRpY2FsIHNlY3Rpb24gYW5kIGNoZWNrIHRoZQo+IHJl
c3VsdGluZyBzbmFwc2hvdCBpbnN0ZWFkIG9mIGNoZWNraW5nIGt2bS0+YXJjaC5wZ2Qgc2VwYXJh
dGVseSBiZWZvcmUKPiBpbml0aWFsaXppbmcgdGhlIEctc3RhZ2UgY29udGV4dC4gVGhpcyBlbnN1
cmVzIHRoYXQgdGhlIHJvb3QgdXNlZCBieQo+IHRoZSB3YWxrIHJlbWFpbnMgcHJvdGVjdGVkIHVu
dGlsIHRoZSB3YWxrIGNvbXBsZXRlcy4KPgo+IE9uIFFFTVUgVENHIHdpdGggNCB2Q1BVcywgcnVu
bmluZyBkaXJ0eV9sb2dfcGVyZl90ZXN0IC12IDMgLWIgMjU2TSAtaSAzCj4gd2l0aCBNR0xSVSBh
Z2luZyBvZiB0aGUgVk0ncyBjZ3JvdXAgZm9yY2VkIGV2ZXJ5IDEwMG1zICg4NiBwYXNzZXMpOgo+
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmVmb3JlICAgICAgYWZ0ZXIKPiAgIG1t
dV9sb2NrIHdyaXRlIHdhaXQsIHRvdGFsICA0NC40IHMgICAgICAwLjE1IHMKPiAgIG1tdV9sb2Nr
IHdyaXRlIGNvbnRlbnRpb25zICAxLDAwMiwwOTIgICAzMCwwOTIKPiAgIG1tdV9sb2NrIHJlYWQg
Y29udGVudGlvbnMgICAzNTEsOTM3ICAgICAwCj4gICBndWVzdCBkaXJ0eS1tZW1vcnkgdGltZSAg
ICAgMTguNiBzICAgICAgMTYuNyBzCj4KPiBCZWZvcmUsIDkzJSBvZiB3cml0ZS1sb2NrIHdhaXRl
cnMgd2VyZSBrdm1fbW11X25vdGlmaWVyX2NsZWFyX3lvdW5nKCkuCj4gV2l0aCBubyBhZ2luZywg
bm8gbWVhbmluZ2Z1bCBkaWZmZXJlbmNlIHdhcyBvYnNlcnZlZCBiZXR3ZWVuIHRoZSB0d28KPiBr
ZXJuZWxzLgo+Cj4gU2lnbmVkLW9mZi1ieTogU2V1bmdKdSBDaGVvbiA8c3V1bmoxMzMxQGdtYWls
LmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz4KClJlZ2FyZHMsCkFudXAKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8va3ZtLXJpc2N2Cg==
