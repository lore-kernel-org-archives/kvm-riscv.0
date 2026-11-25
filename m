Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345F2606A332
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 05:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rmyRSE73;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=IOhal8xJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fPuCib+DYg6cgIvYql9p5LFHDLOecLq17iCsnRxlRHs=; b=rmyRSE738ezyuX7AANdwQz1yc7
	gcW6k9lUgubDPT9BjvToQfdgrbK4L5M4wQkO7dD8m3JUAglLE698ss6gEuBazODd290rcmRfAsCe6
	wZIpa7VewcTklfgsdgAR80E8UV/Inng5v/Ym0D0y3tOF4YU1khm+gWnxTm0mgt9AnT/4XSMpCwLY/
	y/LZGwhwkKS8ZYnWiPaOLu/qSroOV74qBMMaHR7qH/yB2pZSdpocdyq3SNeKFUz3r85xj+La/W8JG
	YOSsE49ffNf/aF7nvsIHFvWWghj78PBFezaG00aSjP9TrIig2+8Y7wABdmzFuVKKn91QFpm99PyvB
	Pachkazw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW5tz-00000008Ug4-40ed;
	Wed, 25 Nov 2026 05:50:43 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW5tw-00000008Ucr-3jWm
	for kvm-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 05:50:42 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so48994435e9.2
        for <kvm-riscv@lists.infradead.org>; Tue, 24 Nov 2026 21:50:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795585839; cv=none;
        d=google.com; s=arc-20260327;
        b=Z0yeIEOEwBCEx8vWFJwkiwYFMz/L2m55j+dHP52SyxOb0/LqqZSxeUBhebdYWDA2B0
         tvAPshNwH5XVt1+aCKgJuvAHcIAxdvXUsmiTv0PEoBYcUHVuSvPvPC4FU1WGyuhMK4ih
         PT+XLyPiS1cUgPeTqV69zTHOX9imvqJmIgAaPv/49qfq5k7rrUK3IoNFKtph1ed0CcX+
         4NDrpPOytP8p+zJehX9U+Yn2Rxn+d8m6W+c+1iOHkWU1OMex850H6qgTHk8GN34qjsJF
         r3FbRLZUgcqoiVy09/FKQEwQCvWuCH901sFDSyQ2OjEFVJJ3LeYkx7tI3PUuoP4QGDbk
         T7gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/ey3VoMnoIASJUisM8PXIjosjBIaHmMcX0osRpbhk3U=;
        fh=735I4n/xdHuw7k5/0CfYjnEqd/92J2ZE/heWaaLpaIM=;
        b=jCVE0uGPwPY0nYSGp3nHwmheRMJpvS5HZD+FQ8INUJP9NGOJfL16yIS/eK8MokRCox
         gnHsKW0ZJv+x1+eillGDOejf8WSXS0ZeGqjk8ErayutBWHn83wRMEyaE2fOzRtDLr8Y4
         Dm4UG6pVG1Nz2/f8YLAMjdbUorEJL+VXxdJil7e4MtKeQlsqStvBANUoZ5CJH8QMGKjZ
         sxOPCfRFJeHDmy/DzxkC405sJGPTjP9MAv43MtBDSfYAao1+zAJvLepEoBo1464AhB1g
         IV19ubODfkGZ5prP9MMialMgps78td11GpX7P1AYk95ejgwiIxCsOBUf8EkGgCN8oPQm
         +eBQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795585839; x=1796190639; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ey3VoMnoIASJUisM8PXIjosjBIaHmMcX0osRpbhk3U=;
        b=IOhal8xJguzQ9zkq0SLHRHdvzPVDFcMf3bORlMOIiT97VjUQJIdvJ90NHukr6rme2N
         p4SZ46EDtWgtVwRmn4cocydFquctQUzQWr0jUT39SyQrnw6eHhIhW0ckHfhPyVLK4i0M
         yk4cABvv8DNVFJWgi6j3qXfFNSmgBMI0MEbiwaGASotfPZytHsFftDhgT91XcZQQcsj1
         rN0nHw+r0GwB2SmUXCcysQCm7uQ6isV9J8AHWTbylqVDx2d2WpAn95zimD8Xan84B7ne
         O0pMnA9g37AMaTHw30jUvvxO8aDg3kp5HqdD82YTV1KDE8CsgcEVc7HrMWw96YmT3vR+
         Wyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585839; x=1796190639;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ey3VoMnoIASJUisM8PXIjosjBIaHmMcX0osRpbhk3U=;
        b=SLhT5ggtzn7Nbuj+0XNF6rltWOlRuxUJy8FZGyJuP0jkg6+89h8p6o4HUYTbE+cfRb
         TNsZ9+4dDyzYxVfb2QZLas6bi2VfqatdEdPNw6TSz/XuuF0mI2xoiPGE+Sum7aNqhz3X
         tvSgpb0jSy+fywngR3Oa+nwjayvEt5t9ojFPp+xBqxI2PvJWaEOIQ9bc3DXKvBc5su41
         pDmq3fhLD5n49VgydJBNuMQcUeBDRqSvOZkZJDOeXbquU95pXDgUkYhWohWCaWI/7OW+
         8qw63t3vSYP+pmkTylgl/1mfrnb+ppIxb6zkHiUKDZv84JRwAqKcg6nPo/QszR6Hfd1l
         3JJQ==
X-Forwarded-Encrypted: i=1; AL+hErHvyukhxuaiP8xi+zytVIlrhOlQkV53IOpR/r13cnt0DawepOE2iDLdeMZ9XJXBXzAUM0pYC0KeU74=@lists.infradead.org
X-Gm-Message-State: APuU4Z8p84CQ+TZTrstGhpZM9J48ZGJvMy27S+HVXmi0nuflykRAz2R/
	tFzJnXTL9SKY8d8kJEwrPwKyhmmBOlysb9JT3yN8M+NwbVWNDUHDg9Y0duJgEmCDuBGZw3D9k2v
	sL9Bqi4WNps/c0ISOhXI7gr46PIz6CpTknejItuyonQ==
X-Gm-Gg: AZFdTZc/WeAMVbiTn/MpzoCodeb+A3o77JBOowhqc19M+9iAu9B64Reo51uxfQV5K3y
	D0ognnMToymeUmvMcKp/oAJRYAVlJbBRpOZb6GBeJ3VMpirm0HWF643zbdfW2m0Kk1i+77RGojU
	424rgCRbkxTVTUX+o8KbbqiyZvrSUqAr9Vin5VC/NRS6AOErU/RkrT7njgMEwdfDQDoEMgBUtAw
	6T7obhuq1IfWScKJx00jr0k2MD+ed8sDEfA7orSIcFXpIUG0HukslNwjF+8qosris9Fo5+tgHSW
	Z46I83w3o08Yi6w5I3x3ICD0Rj4SXu9Iam81dvzcAwzss5Gar9d9/8iYUUHgxTpSapA3xINH+CE
	WLnAFAmeWoLsvEfwqBSO9igzGJj/YVHrlUAGv52gsLboRT7mIlBlvZzKdlar+fat7QeQwOkFO1T
	+8KZe9NnWrEE7vNxZUclc9ElNJ/WF9/wtghgUmgU/AZMVeUn6/g6UgqTbBgxg7Lu0WsSJuu4RK8
	WQz
X-Received: by 2002:a05:600c:46cc:b0:4bb:69b3:2b42 with SMTP id
 5b1f17b1804b1-4bb888277b3mr355988315e9.16.1795585838954; Tue, 24 Nov 2026
 21:50:38 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260921111402.120911-1-suunj1331@gmail.com>
In-Reply-To: <20260921111402.120911-1-suunj1331@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 25 Nov 2026 11:20:26 +0530
X-Gm-Features: Aa3M54qb1blyKaEVtKNBi5ctu8cJHJ3FLqTUOGiPqQSapaUrHW7z2azgq7gQGnk
Message-ID: <CAAhSdy2BkWEY3+FDpcLwFtrP+03GSfJHCmsCmu5513M8AMyPpg@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] KVM: riscv: Age G-stage PTEs locklessly
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Jinyu Tang <tjytimi@163.com>, 
	Wang Yechao <wang.yechao255@zte.com.cn>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_215040_975327_7C4364F1 
X-CRM114-Status: GOOD (  21.59  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBTZXAgMjEsIDIwMjYgYXQgNDo0NOKAr1BNIFNldW5nSnUgQ2hlb24gPHN1dW5qMTMz
MUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQWdpbmcgRy1zdGFnZSBQVEVzIGN1cnJlbnRseSBydW5z
IHdpdGggbW11X2xvY2sgaGVsZCBmb3Igd3JpdGUsIHRha2VuCj4gYnkgdGhlIGNvbW1vbiBNTVUg
bm90aWZpZXIgY29kZS4gV2hlbiBNR0xSVSBvciBrc3dhcGQgYWdlcyBhIGxhcmdlCj4gcmFuZ2Us
IGV2ZXJ5IHZDUFUgdGFraW5nIGEgRy1zdGFnZSBmYXVsdCBibG9ja3Mgb24gdGhlIGxvY2ssIGFu
ZCB0aGUKPiBkaXJ0eS1sb2dnaW5nIHJlYWQtc2lkZSBmYXN0IHBhdGggYmxvY2tzIGJlaGluZCBh
Z2luZyBhcyB3ZWxsLgo+Cj4gVGhpcyBzZXJpZXMgbGV0cyBSSVNDLVYgc2VsZWN0IEtWTV9NTVVf
TE9DS0xFU1NfQUdJTkcsIHNvIEctc3RhZ2UKPiBhZ2luZyBjYW4gcnVuIHdpdGhvdXQgbW11X2xv
Y2sgd2hpbGUgcHJvdGVjdGluZyBwYWdlLXRhYmxlIHdhbGtzIHdpdGgKPiBSQ1UuCj4KPiAgIDEu
IEFnZSBhbGwgRy1zdGFnZSBQVEVzIGluIGEgR0ZOIHJhbmdlCj4gICAgICBCdWcgZml4LCBwb3N0
ZWQgc2VwYXJhdGVseSBbMV0gYW5kIGluY2x1ZGVkIHVuY2hhbmdlZCBzbyB0aGUKPiAgICAgIHNl
cmllcyBhcHBsaWVzIG9uIHJpc2N2X2t2bV9xdWV1ZS4gRHJvcCBpdCBpZiBhbHJlYWR5IGFwcGxp
ZWQuCj4KPiAgIDIuIFJlYWQgRy1zdGFnZSBQVEVzIG9uY2Ugd2hlbiB3YWxraW5nIHBhZ2UgdGFi
bGVzCj4gICAgICBBIGxvY2tsZXNzIHdhbGtlciBtdXN0IGRlcml2ZSBwcmVzZW5jZSwgbGVhZi1u
ZXNzIGFuZCB0aGUgY2hpbGQKPiAgICAgIGFkZHJlc3MgZnJvbSBhIHNpbmdsZSBzbmFwc2hvdCBv
ZiBlYWNoIGVudHJ5Lgo+Cj4gICAzLiBXcml0ZS1wcm90ZWN0IEctc3RhZ2UgUFRFcyBhdG9taWNh
bGx5Cj4gICAgICBBZ2luZyB3aWxsIGNsZWFyIHRoZSBBY2Nlc3NlZCBiaXQgd2l0aG91dCBtbXVf
bG9jazsgdGhlIHBsYWluCj4gICAgICByZWFkLW1vZGlmeS13cml0ZSBpbiBHU1RBR0VfT1BfV1Ag
Y291bGQgY2xvYmJlciB0aGF0IHVwZGF0ZS4KPgo+ICAgNC4gRnJlZSBHLXN0YWdlIHBhZ2UgdGFi
bGVzIGFmdGVyIGFuIFJDVSBncmFjZSBwZXJpb2QKPiAgICAgIFRhYmxlIHBhZ2VzIGFuZCB0aGUg
cm9vdCBvdXRsaXZlIGFueSBSQ1UgcmVhZGVyLiBSb290IHRlYXJkb3duCj4gICAgICBrZWVwcyBw
Z2RfbGV2ZWxzIGludGFjdCBzbyBhIHdhbGtlciBob2xkaW5nIHRoZSBvbGQgcm9vdCBzZWVzCj4g
ICAgICBjb25zaXN0ZW50IG1ldGFkYXRhLgo+Cj4gICA1LiBBZ2UgRy1zdGFnZSBQVEVzIGxvY2ts
ZXNzbHkKPiAgICAgIFNlbGVjdCBLVk1fTU1VX0xPQ0tMRVNTX0FHSU5HIGFuZCB3YWxrIHVuZGVy
IHJjdV9yZWFkX2xvY2soKS4KPgo+IFRoaXMgYnVpbGRzIG9uIEppbnl1IFRhbmcncyByd2xvY2sg
YW5kIGNtcHhjaGcgaGVscGVycyBhbHJlYWR5IGluCj4gcmlzY3Zfa3ZtX3F1ZXVlLiBXYW5nIFll
Y2hhbydzIGh1Z2UgcGFnZSByZWNvdmVyeSBzZXJpZXMgWzJdIGFkZHMgYQo+IHNlY29uZCBwYWdl
LXRhYmxlIGZyZWUgc2l0ZSBpbiBrdm1fcmlzY3ZfZ3N0YWdlX3JlY292ZXJfaHVnZSgpOwo+IHdo
aWNoZXZlciBsYW5kcyBzZWNvbmQgd2lsbCBuZWVkIHRvIHN3aXRjaCB0aGF0IHB1dF9wYWdlKCkg
dG8KPiBnc3RhZ2VfZnJlZV9wYWdlX3RhYmxlKCkuIEkgY2FuIHJlYmFzZSB0aGUgc2VyaWVzIGFz
IG5lZWRlZC4KPgo+IEEgcG9zc2libGUgZm9sbG93LXVwIGlzIHRvIHJ1biBjbGVhci1kaXJ0eS1s
b2cgYW5kIHRoZSBnZW5lcmFsIGZhdWx0Cj4gcGF0aCB1bmRlciB0aGUgcmVhZCBzaWRlIG9mIG1t
dV9sb2NrLCBhcyBhcm02NCBhbmQgeDg2IGRvLiBQYXRjaCAzCj4gcHJvdmlkZXMgdGhlIGF0b21p
YyB3cml0ZS1wcm90ZWN0aW9uIG5lZWRlZCBmb3IgdGhlIGZvcm1lci4KPgo+IFRlc3RpbmcKPiAt
LS0tLS0tCj4gUUVNVSB2aXJ0LCAtY3B1IHJ2NjQsaD10cnVlIChTdmFkdSksIDQgdkNQVXMsIFRD
Ry4gVGhlIGhvc3Qga2VybmVsCj4gd2FzIGJ1aWx0IHdpdGggS0FTQU4sIFBST1ZFX0xPQ0tJTkcs
IFBST1ZFX1JDVSwgTE9DS19TVEFUIGFuZCBMUlVfR0VOLgo+Cj4gQWZ0ZXIgZWFjaCBwYXRjaDoK
PiAgIC0gZGlydHlfbG9nX3BlcmZfdGVzdCAtdiAyIC1iIDI1Nk0gLWkgMwo+ICAgLSBhY2Nlc3Nf
dHJhY2tpbmdfcGVyZl90ZXN0IC12IDIgLWIgMjU2TSAtcyBhbm9ueW1vdXNfdGhwCj4gICAgICgy
TSBUSFAgZGlzYWJsZWQgYW5kIDY0SyBtVEhQIGVuYWJsZWQpCj4gICAtIDIwIFZNIGNyZWF0ZS9k
ZXN0cm95IGl0ZXJhdGlvbnMKPgo+IFdpdGggTUdMUlUgYWdpbmcgZm9yY2VkIG9uIHRoZSBWTSdz
IGNncm91cCBldmVyeSA1MC0xMDBtczoKPiAgIC0gZGlydHlfbG9nX3BlcmZfdGVzdCAtdiAzIC1i
IDI1Nk0gLWkgMwo+ICAgLSAzMCBWTSBjcmVhdGUvZGVzdHJveSBpdGVyYXRpb25zCj4KPiBXaXRo
IENPTkZJR19LVk09bSwgNSBtb2R1bGUgbG9hZC91bmxvYWQgY3ljbGVzLCBlYWNoIHdpdGggYSBW
TSBjcmVhdGVkCj4gYW5kIGRlc3Ryb3llZCBpbW1lZGlhdGVseSBiZWZvcmUgbW9kdWxlIHVubG9h
ZCwgdG8gZXhlcmNpc2UgbW9kdWxlCj4gdGVhcmRvd24gYWZ0ZXIgcXVldWluZyBSQ1UgZnJlZXMu
Cj4KPiBObyBXQVJOLCBLQVNBTiwgbG9ja2RlcCBvciBSQ1UgcmVwb3J0cyB3ZXJlIG9ic2VydmVk
LiBUaGUga3ZtX2FnZV9odmEKPiB0cmFjZXBvaW50IHJlY29yZGVkIGFwcHJveGltYXRlbHkgNjVr
IGV2ZW50cyBwZXIgYWdpbmcgcGFzcy4KPgo+IFBlcmZvcm1hbmNlIHJlc3VsdHMgZnJvbSBkaXJ0
eV9sb2dfcGVyZl90ZXN0IC12IDMgLWIgMjU2TSAtaSAzLCB3aXRoCj4gbG9ja19zdGF0IGVuYWJs
ZWQgZm9yIG1tdV9sb2NrIGFuZCA4NiBhZ2luZyBwYXNzZXM6Cj4KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBubyBhZ2luZyAgICAgICAgICBhZ2luZwo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICBiZWZvcmUgIGFmdGVyICAgICBiZWZvcmUgICBhZnRlcgo+ICAgZ3Vlc3QgZGlydHkgdGlt
ZSAgICAgICAxMi41cyAgIDEyLjRzICAgICAxOC42cyAgICAxNi43cwo+ICAgbW11X2xvY2sgVyB3
YWl0IHRvdGFsICAwLjE1cyAgIDAuMTdzICAgICA0NC40cyAgICAwLjE1cwo+ICAgbW11X2xvY2sg
VyBjb250ZW50aW9ucyAgMzVrICAgICAzNWsgICAgICAxLjBNICAgICAzMGsKPiAgIG1tdV9sb2Nr
IFIgd2FpdCB0b3RhbCAgIDAgICAgICAgMCAgICAgICAgNy41cyAgICAgMAo+Cj4gQmVmb3JlIHRo
ZSBzZXJpZXMsIDkzJSBvZiB3cml0ZS1sb2NrIHdhaXRlcnMgd2VyZSBmcm9tCj4ga3ZtX21tdV9u
b3RpZmllcl9jbGVhcl95b3VuZygpLCBhbmQgdGhlIGRpcnR5LWxvZyByZWFkLXNpZGUgZmFzdCBw
YXRoCj4gd2FpdGVkIGZvciBtbXVfbG9jayAzNTJrIHRpbWVzLiBBZnRlciB0aGUgc2VyaWVzLCBh
Z2luZyBkb2VzIG5vdAo+IGFjcXVpcmUgbW11X2xvY2suCj4KPiBBYnNvbHV0ZSBudW1iZXJzIGFy
ZSBpbmZsYXRlZCBieSBUQ0c7IG9ubHkgdGhlIHJlbGF0aXZlIGNoYW5nZSBpcwo+IG1lYW5pbmdm
dWwuIFVuZGVyIFRDRywgdGhlIGF0b21pYyB3cml0ZS1wcm90ZWN0IGNoYW5nZSBpbiBwYXRjaCAz
Cj4gaW5jcmVhc2VkIHRoZSBjbGVhci1kaXJ0eS1sb2cgdGltZSBmcm9tIGFwcHJveGltYXRlbHkg
MTZtcyB0byAzMG1zLAo+IGFzIFRDRyBzZXJpYWxpc2VzIEFNTyBpbnN0cnVjdGlvbnM7IGhhcmR3
YXJlIG51bWJlcnMgd291bGQgYmUgd2VsY29tZS4KPgo+IFsxXSBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyNjA5MTgwNzI2MjIuMjg0MTg4LTEtc3V1bmoxMzMxQGdtYWlsLmNvbS8KPiBb
Ml0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcva3ZtLXJpc2N2LzIwMjYwOTE0MDU1OTM2LjM2NzI3
NTgtMS13YW5nLnllY2hhbzI1NUB6dGUuY29tLmNuLwo+Cj4gU2V1bmdKdSBDaGVvbiAoNSk6Cj4g
ICBLVk06IHJpc2N2OiBBZ2UgYWxsIEctc3RhZ2UgUFRFcyBpbiBhIEdGTiByYW5nZQo+ICAgS1ZN
OiByaXNjdjogUmVhZCBHLXN0YWdlIFBURXMgb25jZSB3aGVuIHdhbGtpbmcgcGFnZSB0YWJsZXMK
PiAgIEtWTTogcmlzY3Y6IFdyaXRlLXByb3RlY3QgRy1zdGFnZSBQVEVzIGF0b21pY2FsbHkKPiAg
IEtWTTogcmlzY3Y6IEZyZWUgRy1zdGFnZSBwYWdlIHRhYmxlcyBhZnRlciBhbiBSQ1UgZ3JhY2Ug
cGVyaW9kCj4gICBLVk06IHJpc2N2OiBBZ2UgRy1zdGFnZSBQVEVzIGxvY2tsZXNzbHkKPgoKUXVl
dWVkIHRoaXMgc2VyaWVzIGZvciBMaW51eC03LjUKClRoYW5rcywKQW51cAoKLS0gCmt2bS1yaXNj
diBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
