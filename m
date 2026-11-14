Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63673606A329
	for <kvm-riscv@archiver.kernel.org>; Sat, 14 Nov 2026 13:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K6rv/z67;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=LcsHt2HO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UAcRhvyeLXZhr3H4qHpJgo2qIksQ72bax1i3RSQoO6s=; b=K6rv/z675bSMcSORSIzK44Yskw
	1k2duNJ0XtgAhaLPw2qPDL9z0BPcApL9DFtYkzfpWNYrIkU6FAJQwnQOkKkjEUAq4vPp8e1JmH3Ou
	BJow0AG27/KLer6SqM+b/4+JGmvTxwx+h0GzCqZ99yp/XiGYif/44l+xxPokHSvKCpcuCvNbD/6ZU
	XyO0luL/915Y61Hjrwev7RMHPa8YJk4nl0BdaVgOBXk+eC0pNUHaTNHTev24WTOn5O3l5xh6gQbOS
	7iSrR63mjPEzd4Gw/OFv6/Lt7l1OqvnpscS/hkypuXQ3cknnNrbPNGfHHSSRWRIdWxvYwbnm+bC6J
	iHBBrE3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDv2-0000000G7vv-44JO;
	Sat, 14 Nov 2026 13:35:48 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDuz-0000000G7vB-1N3J
	for kvm-riscv@lists.infradead.org;
	Sat, 14 Nov 2026 13:35:46 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-3ae25c9f857so24891231fa.1
        for <kvm-riscv@lists.infradead.org>; Sat, 14 Nov 2026 05:35:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794663342; cv=none;
        d=google.com; s=arc-20260327;
        b=GRjkc4r5TQiqgILTL51IfMj7BWhD+juT+md++vZ18oSjqrjo3skXjtjp+rkHosz6lg
         TWJaPRM95vkbb7h7jwKejxF3y4Xzp7Y2c8FsXr2auZKHnlFR3/vAtHmsPZEa4LvcerVK
         stBSHpNgH2ly7CBJo+u+Vv1Wd/EIt4dHD/0MhQRswguu5yFt6OykLfucyHP0uaYNM1j6
         kxN84IelZJjLaXMIda1V6SF5Q7fEpwy/yao7aXuXcHMgXwmsY/ejdzgY7jbOQvD1CcYU
         iaMhbfmB2hVNPQ3KaHyipa0pFssaR2iHJIdaCgMcF9mxsaeXR3Z6i4BqNvTEqAzXEAmq
         jz1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B7nxs2ziyKSXajCogouyEEECBltRg0HZJSOSZE1z6bs=;
        fh=pE+g1SivyO1ZwNV0r9CbmGRdcKBAQ0iSNyew1d31czQ=;
        b=d7Z7XXEASNIBmit5hSshMAvWdkWIJLup63valBSKt2wsomm4K/Y5cSOsZwuxGJbz41
         TD1HWfIrWHCB3S2b3NreN0nBC1hEPAEs+qp54g+Nk8EIcZuG7oeJf+5KWOZuTy2HqZAf
         shdDr3Atlon9WVqz785nE6mc2kbrGEIfiijiN2C2iaFGlotuHokZqairRve8I3/fq2Fn
         5XGzCBFLddvu/pGN6OAV7Di5je9CjfyxeNrO9z0mVPDEbA3ZPg/VD3pJBpNuYQT/sUNv
         PEK19g38u3cm6r74PfTggUrh0OvXKFUsyUKr1NOGIyVQZMtKvZAPkzPVyiaq9aO60GHn
         dpzg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794663342; x=1795268142; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B7nxs2ziyKSXajCogouyEEECBltRg0HZJSOSZE1z6bs=;
        b=LcsHt2HO8JpupvCF+l6OIozNCDU1o35gwSzDQt0UCqGso9FSwuDcXt3H/NkvDQgzLY
         LUiVySWeNUOMlL7dCKiDiiDkAcyv49nWar7LyeQul9PPV9Ac0sbk1iaj32pZcKhMyi3o
         CLkglsDYf7153yQzqma7E+91TtWJwVPGu7EAMcxXXJrJaivV1XICejgE8ovEIfQXXRjf
         7MDmMS+TC/hBPaH8tdfjZskMKcJIvVCqhKkVsbRq23zDuz1EoeCksCKW11w9D+YTyYIs
         NOVWdH5+ppFy/VNpPWv6o+RMjcTUeN8oWVfeB2gJoJ8oj5QoOedKpjvlrtH3XO3VLTx9
         PXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663342; x=1795268142;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7nxs2ziyKSXajCogouyEEECBltRg0HZJSOSZE1z6bs=;
        b=Tf12EMcuyL1NFnSgjOlRa14Zoo3NQblpqtZvaP41rhQ6jTSegbLfgpSnRcKUBcpSSH
         cSnZXp2ntsQ+U7gvkTjWuoNr600KJVAR5GfDViG3FADXzKef6KJ1Vhx1mVgNLgZwfQOI
         XpHDtNPZJHyVMTWFrtJ8uN1wMLFoADLX7YrfjZhrViyZEv+9DOIBkM08OqyIpPjq9OF1
         PCzvhhe6zslNDihj+m7sYn4G7jyhEV95F13O4Kgc6orEdNGT+QYJbH/p6BQMoNPUPJgN
         pR/osv3enz9szjnLwrR0bZFqmVCwK7mh0QeBkH3pIOEb3ZbVkgwcOyKMyVndPVgMy6Oy
         JyQA==
X-Forwarded-Encrypted: i=1; AL+hErGwZKLNMwetuwkcEUuMByp8j7ehVB9ZMX7jMHvsGw1LjHL2TVMWM5rm7x2K4YH95GEhM2DI8EmAwGw=@lists.infradead.org
X-Gm-Message-State: APuU4Z8vIURFWMK87BcS6ZDtDXU9ZHsHlYT0vmIeey0CHUzoHWPvSF4L
	IkPzWgm4z/gU+6NJ5DOlCehcUFoGOFX16psB2vY3BdX/jwZqBOQBJGnyLitTfrx4bbL42Xw0ez+
	UFzuVBz6YnS1hf6nV4XE7DhqiD0R+SVCqSE52diB01w==
X-Gm-Gg: AYBFou3duNnVPbWIkutXObzuLGd4izY4T8OA2xPgzV3sO6v2cAKP4Q+XDXrUE5nywx1
	5+5/9MxiQITdgNbdGg/Pd4JzXz4gT/Nh1QigVIRvuuD9fkhbv7n2tE9wufB1XQtWq6p8e8Q/c1b
	8dAaGgX3yh9dvy+ezw8BUWm61bUBdT1lfL4ajJAn9hBKEk/vqDg6dg35tOF+ZSAFMf2uoVBfnz5
	GO5H11kzAIyJW/fu0DzAnlfINssKiZP5pFhMoQaXFc9wE+SwCjNz11sXvaYQPceIcFidmkHnvJ6
	g4iJcawJEqmAuMEj55DlWOMNzsTzpTa+z2vSZxmI1YKVe84xlhZCtk11WwTYAcAOYUcrB4v9gI1
	FMMqLwv79wtCuL7+onjsklOAkGRc8ud1w345eYHE9CAMghDnlQr/6MFcbKokCs3cAGZaqFY/C/K
	R2zCj38xI+dIBx+tzoN4jRnhrwtsrm+2GzS6hWTO0ckX5XPkD3y78g5A==
X-Received: by 2002:a05:6512:a84:b0:5c1:5171:4ad7 with SMTP id
 2adb3069b0e04-5c170b383ddmr2080350e87.33.1794663341999; Sat, 14 Nov 2026
 05:35:41 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023142550.148604-1-oleksii.kurochko@gmail.com>
 <CABBgwmuBBbyBytwRBTeAqF=0c1m+TFK8E3yPopGNQAsrMFO2vg@mail.gmail.com> <7e634bef-6d23-4a57-b3e6-b5585045ca19@gmail.com>
In-Reply-To: <7e634bef-6d23-4a57-b3e6-b5585045ca19@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 14 Nov 2026 19:05:28 +0530
X-Gm-Features: AclHuK9nWY20qy2LdzPDWoj5LiIWjiiPX9NCcLCEPiqITYBgVdXOX7JbUWJZ-OQ
Message-ID: <CAAhSdy2cL6u_pAinYFU64nfqespQU+2x3GTeiqvjFUbJyYLLMA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Order IMSIC VS-file write before releasing vsfile_lock
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Atish Patra <atish.patra@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_053545_416320_D8875E37 
X-CRM114-Status: GOOD (  47.39  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBOb3YgMTMsIDIwMjYgYXQgMTE6NDnigK9QTSBPbGVrc2lpIEt1cm9jaGtvCjxvbGVr
c2lpLmt1cm9jaGtvQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gMTEvMTMvMjYgOTowMCBB
TSwgQW51cCBQYXRlbCB3cm90ZToKPiA+IE9uIEZyaSwgT2N0IDIzLCAyMDI2IGF0IDc6NTbigK9Q
TSBPbGVrc2lpIEt1cm9jaGtvCj4gPiA8b2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20+IHdyb3Rl
Ogo+ID4+Cj4gPj4ga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX2luamVjdCgpIHdyaXRlcyB0aGUg
aW50ZXJydXB0IGlkZW50aXR5IHRvIHRoZQo+ID4+IFNFVElQTlVNIHJlZ2lzdGVyIG9mIHRoZSB2
Q1BVJ3MgSU1TSUMgVlMtZmlsZSB3aGlsZSBob2xkaW5nIHZzZmlsZV9sb2NrCj4gPj4gZm9yIHJl
YWRpbmcuIFRoZSBsb2NrIGtlZXBzIHRoZSBWUy1maWxlIGZyb20gYmVpbmcgc3dpdGNoZWQgdW5k
ZXIgdGhlCj4gPj4gaW5qZWN0b3I6IGt2bV9yaXNjdl92Y3B1X2FpYV9pbXNpY191cGRhdGUoKSBh
bmQKPiA+PiBrdm1fcmlzY3ZfdmNwdV9haWFfaW1zaWNfcmVsZWFzZSgpIHRha2UgaXQgZm9yIHdy
aXRpbmcgdG8gbW92ZSB0aGUgdkNQVQo+ID4+IHRvIGEgbmV3IFZTLWZpbGUgb3IgdG8gdGhlIFNX
LWZpbGUsIHRoZW4gcmVhZCBhbmQgY2xlYXIgdGhlIG9sZCBWUy1maWxlCj4gPj4gYW5kIGZyZWUg
aXRzIEhHRUkgbGluZS4KPiA+Pgo+ID4+IE9uIFJJU0MtViwgd3JpdGVsKCkgaXMgZm9sbG93ZWQg
b25seSBieSBtbWlvd2Jfc2V0X3BlbmRpbmcoKS4gVGhlCj4gPj4gdHJhaWxpbmcgImZlbmNlIG8s
dyIgaXMgZGVmZXJyZWQgdG8gc3Bpbl91bmxvY2soKSBieSB0aGUgbW1pb3diKCkKPiA+PiB0cmFj
a2luZywgYW5kIHJ3bG9ja3MgZG9uJ3QgdGFrZSBwYXJ0IGluIHRoYXQgdHJhY2tpbmc6Cj4gPj4g
cXVldWVkX3JlYWRfdW5sb2NrKCkgaXNzdWVzIGp1c3QgImZlbmNlIHJ3LHciIGJlZm9yZSB0aGUg
QU1PLCB3aGljaAo+ID4+IGRvZXNuJ3Qgb3JkZXIgZGV2aWNlIG91dHB1dC4gU28gdGhlIFNFVElQ
TlVNIHdyaXRlIGNhbiBzdGlsbCBiZSBpbgo+ID4+IGZsaWdodCBhZnRlciBhbm90aGVyIGhhcnQg
aGFzIG9ic2VydmVkIHZzZmlsZV9sb2NrIGJlaW5nIHJlbGVhc2VkLiBJZgo+ID4+IHRoZSBvbGQg
VlMtZmlsZSBpcyByZWFkIGFuZCBjbGVhcmVkIGJlZm9yZSB0aGUgd3JpdGUgbGFuZHMsIHRoZQo+
ID4+IGludGVycnVwdCBpcyBsb3N0LiBJZiB0aGUgSEdFSSBsaW5lIGhhcyBhbHJlYWR5IGJlZW4g
aGFuZGVkIG91dAo+ID4+IGFnYWluLCB0aGUgaW50ZXJydXB0IGVuZHMgdXAgaW4gYW5vdGhlciB2
Q1BVJ3MgVlMtZmlsZS4KPiA+Pgo+ID4+IEFkZCBhbiBleHBsaWNpdCBSSVNDVl9GRU5DRShvLCB3
KSBhZnRlciB0aGUgd3JpdGUgdG8gdGhlIFZTLWZpbGUsIHdoaWNoCj4gPj4gaXMgd2hhdCBzcGlu
X3VubG9jaygpIHdvdWxkIGlzc3VlIHZpYSBtbWlvd2IoKS4KPiA+Pgo+ID4+IEZpeGVzOiBkYjhi
N2U5N2Q2MTMgKCJSSVNDLVY6IEtWTTogQWRkIGluLWtlcm5lbCB2aXJ0dWFsaXphdGlvbiBvZiBB
SUEgSU1TSUMiKQo+ID4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzaWkgS3Vyb2Noa28gPG9sZWtzaWku
a3Vyb2Noa29AZ21haWwuY29tPgo+ID4+IC0tLQo+ID4+IFdoeSBSSVNDVl9GRU5DRShvLCB3KSBh
bmQgbm90IG1taW93YigpOgo+ID4+Cj4gPj4gLSBTaW5jZSB0aGUgbW1pb3diKCkgcmV3b3JrIGlu
IHY1LjIgKGUuZy4gY29tbWl0IDYwY2ExZTVhMjAwYwo+ID4+ICAgICgibW1pb3diOiBIb29rIHVw
IG1taW93YiBoZWxwZXJzIHRvIHNwaW5sb2NrcyBhbmQgZ2VuZXJpYyBJL08KPiA+PiAgICBhY2Nl
c3NvcnMiKSksIG1taW93YigpIGlzIGFuIGltcGxlbWVudGF0aW9uIGRldGFpbCBvZiB0aGUgc3Bp
bmxvY2sKPiA+PiAgICBjb2RlLiBFeHBsaWNpdCBpbnZvY2F0aW9ucyB3ZXJlIHJlbW92ZWQgZnJv
bSBkcml2ZXJzIGJ5IGNvbW1pdAo+ID4+ICAgIGZiMjRlYTUyZjc4ZSAoImRyaXZlcnM6IFJlbW92
ZSBleHBsaWNpdCBpbnZvY2F0aW9ucyBvZiBtbWlvd2IoKSIpIGFuZAo+ID4+ICAgIGZyb20gdGhl
IGRvY3VtZW50YXRpb24gYnkgY29tbWl0IDkxNTUzMDM5NmM3OCAoIkRvY3VtZW50YXRpb246IEtp
bGwKPiA+PiAgICBhbGwgcmVmZXJlbmNlcyB0byBtbWlvd2IoKSIpLCBzbyBhZGRpbmcgYSBuZXcg
ZGlyZWN0IGNhbGxlciB3b3VsZCBnbwo+ID4+ICAgIGFnYWluc3QgdGhhdC4KPiA+Pgo+ID4+IC0g
UklTQ1ZfRkVOQ0Uobywgdykgc3RhdGVzIGV4YWN0bHkgdGhlIG9yZGVyaW5nIG5lZWRlZCBoZXJl
IChkZXZpY2UKPiA+PiAgICBvdXRwdXQgYmVmb3JlIHRoZSBzdG9yZSB0aGF0IHJlbGVhc2VzIHRo
ZSBsb2NrKSwgd2hpY2ggaXMgZmluZSBmb3IKPiA+PiAgICBhcmNoLXNwZWNpZmljIGNvZGUsIGFu
ZCBpdCBpcyB0aGUgc2FtZSBpbnN0cnVjdGlvbiBtbWlvd2IoKSBleHBhbmRzIHRvCj4gPj4gICAg
b24gUklTQy1WLiB3bWIoKSAoImZlbmNlIG93LG93Iikgd291bGQgYWxzbyB3b3JrIGJ1dCBpcyBz
dHJvbmdlciB0aGFuCj4gPj4gICAgcmVxdWlyZWQuCj4gPj4KPiA+PiBTY29wZTogdGhpcyBvbmx5
IG9yZGVycyB0aGUgd3JpdGUgYmVmb3JlIHRoZSBsb2NrIHJlbGVhc2UuIFdoZXRoZXIgYQo+ID4+
IHdyaXRlIHRoYXQgaXMgYWxyZWFkeSBpbiBnbG9iYWwgbWVtb3J5IG9yZGVyIGlzIGd1YXJhbnRl
ZWQgdG8gaGF2ZQo+ID4+IHRha2VuIGVmZmVjdCBpbiB0aGUgb2xkIFZTLWZpbGUgYmVmb3JlIGt2
bV9yaXNjdl92Y3B1X2FpYV9pbXNpY191cGRhdGUoKQo+ID4+IG9yIGt2bV9yaXNjdl92Y3B1X2Fp
YV9pbXNpY19yZWxlYXNlKCkgcmVhZHMgYW5kIGNsZWFycyBpdCBpcyBhIHNlcGFyYXRlCj4gPj4g
cXVlc3Rpb24sIHNlZSBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtYWlhL2lzc3Vlcy8x
NzIuIElmIGl0Cj4gPj4gaXNuJ3QsIHRoZXNlIHBhdGhzIHdpbGwgYWxzbyBuZWVkIHRvIGRyYWlu
IHRoZSBvbGQgVlMtZmlsZSwgYW5kIHN1Y2ggYQo+ID4+IGRyYWluIGRlcGVuZHMgb24gdGhlIG9y
ZGVyaW5nIGFkZGVkIGhlcmUuCj4gPj4gLS0tCj4gPj4gICBhcmNoL3Jpc2N2L2t2bS9haWFfaW1z
aWMuYyB8IDcgKysrKysrKwo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+
ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jIGIvYXJjaC9y
aXNjdi9rdm0vYWlhX2ltc2ljLmMKPiA+PiBpbmRleCBmMTdkYzU1OWE3MDkuLjgwN2JiNzNhMTI5
YSAxMDA2NDQKPiA+PiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYwo+ID4+ICsrKyBi
L2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jCj4gPj4gQEAgLTEwNTYsNiArMTA1NiwxMyBAQCBp
bnQga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX2luamVjdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUs
Cj4gPj4KPiA+PiAgICAgICAgICBpZiAoaW1zaWMtPnZzZmlsZV9jcHUgPj0gMCkgewo+ID4+ICAg
ICAgICAgICAgICAgICAgd3JpdGVsKGlpZCwgaW1zaWMtPnZzZmlsZV92YSArIElNU0lDX01NSU9f
U0VUSVBOVU1fTEUpOwo+ID4+ICsgICAgICAgICAgICAgICAvKgo+ID4+ICsgICAgICAgICAgICAg
ICAgKiByd2xvY2tzIGRvbid0IHBhcnRpY2lwYXRlIGluIG1taW93YigpIHRyYWNraW5nLCBzbyBv
cmRlcgo+ID4+ICsgICAgICAgICAgICAgICAgKiB0aGUgd3JpdGUgdG8gdGhlIFZTLWZpbGUgYmVm
b3JlIHJlbGVhc2luZyB2c2ZpbGVfbG9jaywKPiA+PiArICAgICAgICAgICAgICAgICogaS5lLiBi
ZWZvcmUgdGhlIHZDUFUgY2FuIGJlIG1vdmVkIG9mZiB0aGlzIFZTLWZpbGUgYW5kCj4gPj4gKyAg
ICAgICAgICAgICAgICAqIHRoZSBWUy1maWxlIHJlYWQgYW5kIGNsZWFyZWQuCj4gPj4gKyAgICAg
ICAgICAgICAgICAqLwo+ID4+ICsgICAgICAgICAgICAgICBSSVNDVl9GRU5DRShvLCB3KTsKPiA+
Cj4gPiBBbm90aGVyIGZlbmNlIGFmdGVyIGV2ZXJ5IHdyaXRlbCgpIGlzIGEgYmlnIGhhbW1lciBp
biB0aGUgcGF0aC4KPiA+Cj4gPiBJZiB0aGUgaW50ZW50aW9uIGlzIHRvIGhhdmUgY29ycmVjdCBj
b250ZW50cyB3aGVuIFZTLWZpbGUgaXMgcmVhZCB0aGVuCj4gPiBiZXR0ZXIgcGxhY2UgdG8gYWRk
IGEgZmVuY2UgaXMgYXQgdGhlIHN0YXJ0IG9mIGltc2ljX3ZzZmlsZV9sb2NhbF9yZWFkKCkuCj4g
VGhhbmtzIGZvciB0aGUgcmV2aWV3Lgo+Cj4gSSBkb24ndCB0aGluayBhIGZlbmNlIGluIGltc2lj
X3ZzZmlsZV9sb2NhbF9yZWFkKCkgaGVscHMgaGVyZS4gVGhlCj4gcHJvYmxlbSBpcyBvbiB0aGUg
d3JpdGVyJ3Mgc2lkZSwgYW5kIGltc2ljX3ZzZmlsZV9sb2NhbF9yZWFkKCkgcnVucyBvbgo+IGEg
ZGlmZmVyZW50IGhhcnQuCj4KPiBUaGUgU0VUSVBOVU0gd3JpdGUgaXMgZG9uZSBieSB3aGljaGV2
ZXIgaGFydCBjYWxscwo+IGt2bV9yaXNjdl92Y3B1X2FpYV9pbXNpY19pbmplY3QoKSwgd2hpY2gg
Y2FuIGJlIGFueSBDUFUgKGlycWZkLAo+IGlvY3RsLCAuLi4pLiBpbXNpY192c2ZpbGVfbG9jYWxf
cmVhZCgpIHJ1bnMgb24gdGhlIG9sZCB2c2ZpbGVfY3B1LCB2aWEKPiB0aGUgSVBJIGZyb20gaW1z
aWNfdnNmaWxlX3JlYWQoKS4gQSBmZW5jZSBvbmx5IG9yZGVycyB0aGUgYWNjZXNzZXMgb2YKPiB0
aGUgaGFydCB0aGF0IGV4ZWN1dGVzIGl0LCBzbyBhIGZlbmNlIG9uIHRoZSByZWFkaW5nIGhhcnQg
Y2FuJ3QgbWFrZQo+IGFub3RoZXIgaGFydCdzIE1NSU8gc3RvcmUgbGFuZC4KPgo+IFdpdGhvdXQg
dGhlIGZlbmNlLCB0aGlzIGNhbiBoYXBwZW46Cj4KPiAgICBoYXJ0IEEgKGluamVjdCkgICAgICAg
ICAgICBoYXJ0IEIgKHVwZGF0ZS9yZWxlYXNlKSAgICBoYXJ0IEMgKG9sZAo+IHZzZmlsZV9jcHUp
Cj4gICAgcmVhZF9sb2NrKCkKPiAgICB3cml0ZWwoU0VUSVBOVU0pCj4gICAgICAoc3RvcmUgc3Rp
bGwgaW4gZmxpZ2h0KQoKT3ZlciBoZXJlIHRoZSBNTUlPIHdyaXRlIHRhcmdldHMgaGFydCBDIElN
U0lDCgo+ICAgIHJlYWRfdW5sb2NrKCkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB3
cml0ZV9sb2NrKCkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzd2l0Y2ggVlMtZmls
ZQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHdyaXRlX3VubG9jaygpCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgSVBJIC0tLS0tLS0tLS0tLS0tLS0tLS0+Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmZW5jZSAg
PC1wcm9wb3NlZAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcmVhZCtjbGVhciBWU2ZpbGUKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBmcmVlIEhHRUkKPiAgICBTRVRJUE5VTSBsYW5kczogdGhlIGludGVycnVwdAo+ICAgIGlz
IGxvc3QsIG9yIGVuZHMgdXAgaW4gYW5vdGhlcgo+ICAgIHZDUFUncyBWUy1maWxlIGlmIHRoZSBI
R0VJIHdhcwo+ICAgIGFscmVhZHkgcmV1c2VkCj4KPiBIYXJ0IEEncyB1bmxvY2sgY2FuIGJlY29t
ZSB2aXNpYmxlIGJlZm9yZSBpdHMgU0VUSVBOVU0gd3JpdGUgaGFzCj4gcmVhY2hlZCB0aGUgSU1T
SUMsIGJlY2F1c2UgcmVhZF91bmxvY2soKSBkb2Vzbid0IG9yZGVyIGRldmljZSBvdXRwdXQuCj4g
Tm90aGluZyB0aGF0IGhhcnQgQiBvciBoYXJ0IEMgZG9lcyBhZnRlcndhcmRzIGNhbiB3YWl0IGZv
ciB0aGF0IHdyaXRlLgo+IE9ubHkgaGFydCBBIGNhbiBob2xkIGJhY2sgaXRzIHVubG9jayB1bnRp
bCB0aGUgd3JpdGUgaXMgb3JkZXJlZCwgYW5kCj4gdGhhdCBpcyB3aGF0IHRoZSBmZW5jZSBvLHcg
YWZ0ZXIgd3JpdGVsKCkgZG9lcy4KPgo+IFdpdGggdGhlIGZlbmNlOgo+Cj4gICAgaGFydCBBIChp
bmplY3QpICAgICAgICAgICAgaGFydCBCICh1cGRhdGUvcmVsZWFzZSkgICAgaGFydCBDIChvbGQK
PiB2c2ZpbGVfY3B1KQo+ICAgIHJlYWRfbG9jaygpCj4gICAgd3JpdGVsKFNFVElQTlVNKQo+ICAg
IGZlbmNlIG8sdwo+ICAgIHJlYWRfdW5sb2NrKCkKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB3cml0ZV9sb2NrKCkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzd2l0Y2gg
VlMtZmlsZQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHdyaXRlX3VubG9jaygpCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSVBJIC0tLS0tLS0tLS0tLS0tLS0tLS0+Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJl
YWQrY2xlYXIgVlMtZmlsZQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZyZWUgSEdF
SQo+Cj4gVGhlIFNFVElQTlVNIHdyaXRlIGlzIG5vdyBvcmRlcmVkIGJlZm9yZSB0aGUgdW5sb2Nr
LCBzbyBpdCBpcyBhbHNvCj4gb3JkZXJlZCBiZWZvcmUgZXZlcnl0aGluZyBoYXJ0IEIgZG9lcyBh
ZnRlciB0YWtpbmcgdGhlIGxvY2ssIGFuZCwKPiB0aHJvdWdoIHRoZSBJUEksIGJlZm9yZSBoYXJ0
IEMgcmVhZHMgdGhlIG9sZCBWUy1maWxlLiBJdCBjYW4gbm8gbG9uZ2VyCj4gYXJyaXZlIGFmdGVy
IHRoZSByZWFkIG9yIGFmdGVyIHRoZSBIR0VJIGlzIGZyZWVkLgo+Cj4gQWJvdXQgdGhlIGNvc3Q6
IHRoaXMgaXMgdGhlIHNhbWUgZmVuY2UgdGhhdCBldmVyeSB3cml0ZWwoKSB1bmRlciBhCj4gc3Bp
bmxvY2sgYWxyZWFkeSBnZXRzLiBPbiBSSVNDLVYsIHdyaXRlbCgpIG9ubHkgc2V0cyBtbWlvd2Ig
cGVuZGluZyBhbmQKPiBzcGluX3VubG9jaygpIHRoZW4gaXNzdWVzICJmZW5jZSBvLHciLiBXZSBu
ZWVkIGl0IGV4cGxpY2l0bHkgaGVyZSBvbmx5Cj4gYmVjYXVzZSB2c2ZpbGVfbG9jayBpcyBhbiBy
d2xvY2suIEl0IHJ1bnMgb25jZSBwZXIgaW5qZWN0ZWQgTVNJLCBhbmQKPiBvbmx5IHdoZW4gdGhl
IHZDUFUgaGFzIGEgVlMtZmlsZS4KCkkgYW0gc3RpbGwgbm90IG9uLWJvYXJkIGFkZGluZyBhIGJh
cnJpZXIgaW4gaG90LXBhdGguIEFsc28sIGFueSBiYXJyaWVyCndlIGFkZCBtdXN0IGJlIHBhaXJl
ZCB3aXRoIGEgYmFycmllciBlbHNlIHdoZXJlIHdpdGggcHJvcGVyIGNvbW1lbnRzCnNvIHRoaXMg
c2luZ2xlIGJhcnJpZXIgYW55d2F5cyBkb2VzIG5vdCBzYXRpZnkgdGhpcyByZXF1aXJlbWVudC4K
Ckluc3RlYWQgb2YgdGhpcywgSSB0aGluayBhIG11Y2ggY2xlYW5lciBhcHByb2FjaCBpcyB0byBj
b252ZXJ0IHZzZmlsZV9sb2NrCnRvIHJhd19zcGlubG9ja190LiBUaGUgY3VycmVudCB2c2ZpbGVf
bG9jayBiZWluZyBhIHJ3bG9ja190IGlzIGNyZWF0ZSBvdGhlcgppc3N1ZXMgYXMgd2VsbCBbMV0u
IFRoaXMgd2lsbCBhbHNvIGFsbG93IHVzIHRvIHVzZSB3cml0ZWxfcmVsYXhlZCgpIGluIHRoZQpr
dm1fcmlzY3ZfdmNwdV9haWFfaW1zaWNfaW5qZWN0KCkgc2luY2UgcmF3X3NwaW5fdW5sb2NrKCkg
d2lsbCB0YWtlCmNhcmUgb2YgZHJhaW5pbmcgdGhlIHdyaXRlIGJ1ZmZlci4KCkkgd2lsbCBwb3N0
IHNvbWV0aGluZyBhbG9uZyB0aGVzZSBsaW5lcy4KClJlZ2FyZHMsCkFudXAKClsxXSBodHRwczov
L2xvcmUua2VybmVsLm9yZy9yLzIwMjYwOTI1MTU1MTE2LjQ2NTIwMy0xLWFuZHJldy5qb25lc0Bv
c3MucXVhbGNvbW0uY29tCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2t2bS1yaXNjdgo=
