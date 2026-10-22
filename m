Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93052606A323
	for <kvm-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 05:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bwuIyOkt;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=jlCYEnO5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WkSgPIfD1zT5m7XsN22v8MXkF8vLKA9ompUsLItES+Q=; b=bwuIyOktusPsMH
	pB3upo2ykfy/9DwV1l5NQcQ+1d/Ny29G6Rxlty9C6IwJv+XbzF4XkrA9gkJ5hhl7AhXzMPN1STIfJ
	qLBskg6RZ39ZwtVDXUjCrGhsPVdKw5xfGKcQ99WhFKUlj5/YF+m9e8vd1S7+C+s/uwBH1dWuPLpJF
	SjhhftKBslSR1PL2PVK0sjaWQSWab7hwPR2mxXBawiN4aAc/x56Z3pLVlQs/1uXC1b5Oy8AfpiO9V
	mFlLpOU0KQkLRxzlRFDcnp0s+EeuYLd1ry3Gwo33zIK2bLVWAFqt/qooLvH8k5El5qUC2O0uwHe4G
	Dtz7pKYZ9B8U/cv9yfzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlEO-0000000DNNa-1RjA;
	Thu, 22 Oct 2026 05:20:48 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlEM-0000000DNMP-02hg
	for kvm-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 05:20:47 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso1175777f8f.0
        for <kvm-riscv@lists.infradead.org>; Wed, 21 Oct 2026 22:20:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792646444; cv=none;
        d=google.com; s=arc-20260327;
        b=TtkWaUmnuoL4NrWfjfBPozCruPaH6qzBkkOPJkD7CMXLbTkx83KqwRy56DUE2J+bOU
         1kis7/8WDx+Cjlr4616p0JIo1e9ZOhUM5azUhUDAziu/mVGsA0MyunGaM9qH2FL/Lgpp
         LPPrHTpaig9miy7q9bqt0ljYP37u/1ToIhSi2N7xLV4b5jvXimJoabFAoervYO+AHwDE
         iSPG31MhwfbAmbdPSSWfEiCoODFUgJxlAAlAUwKPV4aNFudsgiSdoGKsTGAJc/flNKV7
         UjSruz1uFMgYdNlN0eh/6+r0IZpSXwfJciBPRHZwVVlFonANT7I0qiKT6wUoUKRe/vIA
         vTmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5dV8J2o+756ExcNaGq9topEd2CgNZBpheBIgCfX69Gs=;
        fh=FEihd04g19V8a7ksiM+uBJaYjHwMiaxo3r22a9B0oUM=;
        b=aqABD+GWVEWtzkk9xG5wdFWvWAI7WdCyinL1elxCSt0JUfaufSSapW3sYWVllEEbVo
         QjoHqSdcShziMzMkkIkcb0qMSONvRcvb5XwcZcbKbGXAPGPmFffwpGa92R9T4VDTRiQd
         3nMP0YqBSMJ42n9SOOV81EI8jnqYDj7R/m18SpCN69tB6mbPE/x7jqieT6W6ogzrdlGd
         TL1vIzEnB585tqmCMoNNhwrVz3E4Dxx7j7fd5UtU0Vo5v4/eymzb2r3QoaBdAg4Fe+/D
         hTGws1dl+ietG1EzOvuJvZtY/9+kpXzpz9UeQHCs4hl17kYrsurRX1056Xj9ifT/SVeD
         PYwQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792646444; x=1793251244; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5dV8J2o+756ExcNaGq9topEd2CgNZBpheBIgCfX69Gs=;
        b=jlCYEnO5ODRdBu/xbtRLzkSIV4o9X8xGIrQN6l43dLoP//eJA6horHGe+pwq8gv1Pb
         cETuis6ELcpSYKJmCYAqqoC4OS+v2LSEToyVuhOGPFvk7B+DJss48PywPA52py5z1dxh
         /bCHQw9XoHht8E376AqBjOtZkB2UXDAa3Cz7kSTqO0hJChajDD+2WZlZXWoX1HWkrtaF
         RQJo9a4Yr7m+SgF7h5KKKHV9Jz4EGhikxOEfuk1ryudbeE9wVyvMz319ntEQYRPe2JKg
         d77hsfWOazC9OHA/LhZBegO94KfVSMOaF+eTcGDYy1AP4cUAxYQofjr0jeXCV159dHg6
         g2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646444; x=1793251244;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5dV8J2o+756ExcNaGq9topEd2CgNZBpheBIgCfX69Gs=;
        b=TPkvOzNXQwXsOfDjo1TQOUXGfBdIis8i58ekP3k2EC/0j4QV//t5EYaRt+fOr1id4M
         CkEwr3sqFgL6tdAGvSpkYGiLXblq/ge7IWwsVfBZAizPzi+Ta0m6xjyW/h4NRe6YhgJW
         0Y0s3rb/AuwWrRhYQ3CXw7Kk5lX6yryXzjhbx6fyCmVPS6umDcvrzFCSEyBX7Yuy1F1r
         6BYm1kf4kntdbxnV6vmmSDWidTMCNFppWiMjQHw8evoajUXKt2GsjQMLHD+8wxdw3sAZ
         Okd1WvTNOYcl96NBr4D1225yhg1NaeviRilzWanuAeaPXWUgONgc8a+wBaKVcWMzwk+s
         D0EQ==
X-Gm-Message-State: AFq9FYKjhuE/+Jo0C7bJXv5cDoWublYV+CHCPiYAVTjaEyuJZNRQSEF+
	mQtrtSbVpJPTK/8bDgYqy9I87OdWFLnmcDAQiTfw8jOoMYMZXHp1I+joi8lZe7okYaP8s3y8AmO
	kpGkp52OWZr5aFU8nWGjfd/fWnKrcnyhkno209nd0AA==
X-Gm-Gg: AYBFou3bEQU0yymMruRbZvuICwVdrsZjkN9tHP+os+/U2K/twdJa0W7dHkIna8bVEmq
	9rwnwqIPxRwteFWxmiKhAR95uAIY+kTFeKtSgllsZ/ooduz/lsu8/dU9wA4qT68faaT9rioPgjd
	7VxT/14Mofn0D5mn7pdbdJwFbIMwYSSKpK0/T8oj1Hhc46xk70aUdZ9K5XSQfc/jA9iizeBOLHu
	S9mXvP7y3XiP3eiOR4bpCDwEvWB/jVxQ+1CCUfp1m4y2LQpr5xZi887eC7vzvFcBQiLL+i4hQ7l
	CWPHG0GcnjjhnRxNdgaLyANU0pfZwbVigpqgW3LVLik0HMURiAR8yfIYsOCqgn1b3JDsWp2NFWM
	Qwng+zFPCFtt1aZSIrFiO1Yvd1yx6eOIfHwtxTBBLyzCyNHSh9z5poKgXO72HzpOHGFDmgjjkDW
	ESIY1ITnv36JqDTQTi2y5E+YkMA0+Bfds+AjMC2vUMt0ilkPSFpmBVIl2jnVj4pIUa0Xoh9c0gE
	/S/8Q==
X-Received: by 2002:a05:6000:4025:b0:48d:c29e:40c3 with SMTP id
 ffacd0b85a97d-48e264bdcd8mr8669565f8f.33.1792646444331; Wed, 21 Oct 2026
 22:20:44 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019134709.2610129-1-andrew.jones@linux.dev> <atZPqGKEip_sW3fr@orel>
In-Reply-To: <atZPqGKEip_sW3fr@orel>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 22 Oct 2026 10:50:32 +0530
X-Gm-Features: AclHuK8Srkuid1EQZ7HZGvxQuXz3bcbCHVgrlN5FrFRdxoTbUp0B6JefKaok7ws
Message-ID: <CAAhSdy0KvbHT6iShPfMkhePP0V2cVohv6WcHWieWLwZYqkFnjg@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Convert IMSIC vsfile_lock to a raw spinlock
To: Andrew Jones <andrew.jones@linux.dev>
Cc: kvm-riscv@lists.infradead.org, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_222046_061958_56A6375F 
X-CRM114-Status: GOOD (  15.20  )
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

T24gTW9uLCBPY3QgMTksIDIwMjYgYXQgMTA6NDbigK9QTSBBbmRyZXcgSm9uZXMgPGFuZHJldy5q
b25lc0BsaW51eC5kZXY+IHdyb3RlOgo+Cj4gT24gTW9uLCBPY3QgMTksIDIwMjYgYXQgMDM6NDc6
MDlQTSArMDIwMCwgQW5kcmV3IEpvbmVzIHdyb3RlOgo+ID4ga3ZtX3Jpc2N2X3ZjcHVfYWlhX2lt
c2ljX3B1dCgpIHJ1bnMgZnJvbSB0aGUgc2NoZWR1bGVyIHByZWVtcHRpb24KPiA+IG5vdGlmaWVy
IHdpdGggdGhlIHJhdyBydW5xdWV1ZSBsb2NrIGhlbGQsIHNvIGl0IG11c3Qgbm90IHRha2UKPiA+
IHZzZmlsZV9sb2NrLCBhbiByd2xvY2tfdCwgd2hpY2ggc2xlZXBzIG9uIFBSRUVNUFRfUlQuIEFs
bCB2c2ZpbGVfbG9jawo+ID4gY3JpdGljYWwgc2VjdGlvbnMgYXJlIHNob3J0LCBzbyBhIHJhdyBz
cGlubG9jayBpcyBmaW5lLgo+ID4KPiA+IEZpeGVzOiA0Y2VjODlkYjgwYmEgKCJSSVNDLVY6IEtW
TTogTW92ZSBIR0VJW0V8UF0gQ1NSIGFjY2VzcyB0byBJTVNJQyB2aXJ0dWFsaXphdGlvbiIpCj4g
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFuZHJldy5qb25lc0BsaW51eC5kZXY+Cj4g
PiAtLS0KPiA+IHYyOgo+ID4gIC0gQ29udmVydCB2c2ZpbGVfbG9jayB0byByYXdfc3BpbmxvY2tf
dCBpbnN0ZWFkIG9mIGFkZGluZyBhIHNlcGFyYXRlCj4gPiAgICBoZ2VpX2xvY2sgW0FudXBdCj4K
PiBIaSBBbnVwLAo+Cj4gU2FzaGlrbyBmb3VuZCBhbiBBQkJBIGRlYWRsb2NrIHdpdGggdGhpcyB2
MlsxXS4gTWFraW5nIHZzZmlsZV9sb2NrCj4gZXhjbHVzaXZlIHNlcmlhbGl6ZXMga3ZtX3Jpc2N2
X3ZjcHVfYWlhX2ltc2ljX3B1dCgpLCB3aGljaCBydW5zIHVuZGVyCj4gcnEtPl9fbG9jaywgYWdh
aW5zdCB0aGUgU1ctZmlsZSBpbmplY3QgcGF0aHMsIHdoaWNoIGtpY2sgdGhlIHZDUFUKPiAocGlf
bG9jay9ycS0+X19sb2NrKSB3aGlsZSBob2xkaW5nIHZzZmlsZV9sb2NrLiBMb2NrZGVwIGNvbmZp
cm1zIGl0IHdpdGgKPiBhbiBFTVVMIG1vZGUgZ3Vlc3QsIGFuZCB0aGUgaG9zdCB0aGVuIGhhbmdz
IChJIHNob3VsZCBoYXZlIHRlc3RlZCB3aXRoCj4gRU1VTCBiZWZvcmUuLi4pLiB2MSBkb2Vzbid0
IGhhdmUgdGhlIHByb2JsZW0sIHNpbmNlIGl0cyBoZ2VpX2xvY2sgbmV2ZXIKPiBoYXMgYW55dGhp
bmcgdGhhdCB3YWtlcyB0YXNrcyBuZXN0ZWQgdW5kZXIgaXQuIEkgdGVzdGVkIHYxIGluIGJvdGgg
RU1VTAo+IG1vZGUgYW5kIGh3YWNjZWwgbW9kZSBbYWdhaW5dIHdpdGggbG9ja2RlcCBhbmQgaXQn
cyBnb29kLgo+Cj4gU2hvdWxkIHdlIHRha2UgdjEgaW5zdGVhZD8KPgo+IFsxXSBodHRwczovL3Nh
c2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjEwMTkxMzQ3MDkuMjYxMDEyOS0xLWFuZHJldy5qb25l
c0BsaW51eC5kZXY/cGFydD0xCj4KCk9rYXksIHdlIHdpbGwgZ28gYWhlYWQgd2l0aCB5b3VyIHYx
LgoKUmVnYXJkcywKQW51cAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9rdm0tcmlzY3YK
