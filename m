From: Björn Töpel <bjorn@kernel.org>
Date: Tue, 23 May 2023 15:45:40 +0200
Subject: [PATCH -next v20 21/26] riscv: Add sysctl to set the default
 vector rule for new processes
In-Reply-To: <20230518161949.11203-22-andy.chiu@sifive.com>
References: <20230518161949.11203-1-andy.chiu@sifive.com>
 <20230518161949.11203-22-andy.chiu@sifive.com>
Message-ID: <87wn0zb1q3.fsf@all.your.base.are.belong.to.us>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Andy Chiu <andy.chiu@sifive.com> writes:

> To support Vector extension, the series exports variable-length vector
> registers on the signal frame. However, this potentially breaks abi if
> processing vector registers is required in the signal handler for old
> binaries. For example, there is such need if user-level context switch
> is triggerred via signals[1].
>
> For this reason, it is best to leave a decision to distro maintainers,
> where the enablement of userspace Vector for new launching programs can
> be controlled. Developers may also need the switch to experiment with.
> The parameter is configurable through sysctl interface so a distro may
> turn off Vector early at init script if the break really happens in the
> wild.
>
> The switch will only take effects on new execve() calls once set. This
> will not effect existing processes that do not call execve(), nor
> processes which has been set with a non-default vstate_ctrl by making
> explicit PR_RISCV_V_SET_CONTROL prctl() calls.
>
> Link: https://lore.kernel.org/all/87cz4048rp.fsf at all.your.base.are.belong.to.us/
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
> Reviewed-by: Vincent Chen <vincent.chen@sifive.com>
> ---
> Changelog v20:
>  - Use READ_ONCE to access riscv_v_implicit_uacc (Bj?rn)

Reviewed-by: Bj?rn T?pel <bjorn@rivosinc.com>

