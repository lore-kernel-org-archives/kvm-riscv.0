From: Palmer Dabbelt <palmer@rivosinc.com>
Date: Fri, 09 Jun 2023 07:00:15 -0700
Subject: [PATCH -next v21 00/27] riscv: Add vector ISA support
In-Reply-To: <20230605110724.21391-1-andy.chiu@sifive.com>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
Message-ID: <168631921599.10550.825478104843856670.b4-ty@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


On Mon, 05 Jun 2023 11:06:57 +0000, Andy Chiu wrote:
> This is the v21 patch series for adding Vector extension support in
> Linux. Please refer to [1] for the introduction of the patchset. The
> v21 patch series was aimed to solve build issues from v19, provide usage
> guideline for the prctl interface, and address review comments on v20.
> 
> Thank every one who has been reviewing, suggesting on the topic. Hope
> this get a step closer to the final merge.
> 
> [...]

Applied, thanks!

[01/27] riscv: Rename __switch_to_aux() -> fpu
        https://git.kernel.org/palmer/c/419d5d38ac5d
[02/27] riscv: Extending cpufeature.c to detect V-extension
        https://git.kernel.org/palmer/c/dc6667a4e7e3
[03/27] riscv: hwprobe: Add support for probing V in RISCV_HWPROBE_KEY_IMA_EXT_0
        https://git.kernel.org/palmer/c/162e4df137c1
[04/27] riscv: Add new csr defines related to vector extension
        https://git.kernel.org/palmer/c/b5665d2a9432
[05/27] riscv: Clear vector regfile on bootup
        https://git.kernel.org/palmer/c/6b533828726a
[06/27] riscv: Disable Vector Instructions for kernel itself
        https://git.kernel.org/palmer/c/74abe5a39d3a
[07/27] riscv: Introduce Vector enable/disable helpers
        https://git.kernel.org/palmer/c/0a3381a01dcc
[08/27] riscv: Introduce riscv_v_vsize to record size of Vector context
        https://git.kernel.org/palmer/c/7017858eb2d7
[09/27] riscv: Introduce struct/helpers to save/restore per-task Vector state
        https://git.kernel.org/palmer/c/03c3fcd9941a
[10/27] riscv: Add task switch support for vector
        https://git.kernel.org/palmer/c/3a2df6323def
[11/27] riscv: Allocate user's vector context in the first-use trap
        https://git.kernel.org/palmer/c/cd054837243b
[12/27] riscv: Add ptrace vector support
        https://git.kernel.org/palmer/c/0c59922c769a
[13/27] riscv: signal: check fp-reserved words unconditionally
        https://git.kernel.org/palmer/c/a45cedaa1ac0
[14/27] riscv: signal: Add sigcontext save/restore for vector
        https://git.kernel.org/palmer/c/8ee0b41898fa
[15/27] riscv: signal: Report signal frame size to userspace via auxv
        https://git.kernel.org/palmer/c/e92f469b0771
[16/27] riscv: signal: validate altstack to reflect Vector
        https://git.kernel.org/palmer/c/76e22fdc2c26
[17/27] riscv: prevent stack corruption by reserving task_pt_regs(p) early
        https://git.kernel.org/palmer/c/c7cdd96eca28
[18/27] riscv: kvm: Add V extension to KVM ISA
        https://git.kernel.org/palmer/c/bf78f1ea6e51
[19/27] riscv: KVM: Add vector lazy save/restore support
        https://git.kernel.org/palmer/c/0f4b82579716
[20/27] riscv: hwcap: change ELF_HWCAP to a function
        https://git.kernel.org/palmer/c/50724efcb370
[21/27] riscv: Add prctl controls for userspace vector management
        https://git.kernel.org/palmer/c/1fd96a3e9d5d
[22/27] riscv: Add sysctl to set the default vector rule for new processes
        https://git.kernel.org/palmer/c/7ca7a7b9b635
[23/27] riscv: detect assembler support for .option arch
        https://git.kernel.org/palmer/c/e4bb020f3dbb
[24/27] riscv: Enable Vector code to be built
        https://git.kernel.org/palmer/c/fa8e7cce55da
[25/27] riscv: Add documentation for Vector
        https://git.kernel.org/palmer/c/04a4722eeede
[26/27] selftests: Test RISC-V Vector prctl interface
        https://git.kernel.org/palmer/c/7cf6198ce22d
[27/27] selftests: add .gitignore file for RISC-V hwprobe
        https://git.kernel.org/palmer/c/1e72695137ef

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


